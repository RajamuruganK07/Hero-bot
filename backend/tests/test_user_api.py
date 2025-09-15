import os

# Set a dummy MONGODB_URI before importing app components
os.environ["MONGODB_URI"] = "mongodb://dummy:27017"

import pytest
import pytest_asyncio
from httpx import ASGITransport, AsyncClient
from mongomock_motor import AsyncMongoMockClient

from app.main import app
from app.database.connection import get_db

# Mark all tests in this module as asyncio
pytestmark = pytest.mark.asyncio


@pytest_asyncio.fixture(scope="function")
async def async_client():
    """
    Fixture to provide a test client with a mocked database.
    """
    # Setup: create a mock db
    mock_db = AsyncMongoMockClient().db
    await mock_db.users.create_index("email", unique=True)
    await mock_db.users.create_index("username", unique=True)

    # Override dependency to return the mock db
    def override_get_db():
        yield mock_db

    app.dependency_overrides[get_db] = override_get_db

    # Yield the test client
    async with AsyncClient(
        transport=ASGITransport(app=app), base_url="http://test"
    ) as api_client:
        yield api_client

    # Teardown: clean up override
    del app.dependency_overrides[get_db]


async def test_create_user(async_client: AsyncClient):
    """
    Test creating a new user.
    """
    import time

    unique_id = int(time.time())
    email = f"testuser{unique_id}@example.com"
    username = f"testuser{unique_id}"

    response = await async_client.post(
        "/users/",
        json={
            "email": email,
            "username": username,
            "full_name": "Test User",
        },
    )
    assert response.status_code == 201
    data = response.json()
    assert data["email"] == email
    assert data["username"] == username
    assert data["full_name"] == "Test User"
    assert "id" in data


async def test_create_user_duplicate_email(async_client: AsyncClient):
    """
    Test creating a user with a duplicate email.
    """
    import time

    unique_id = int(time.time())
    email = f"testuser{unique_id}@example.com"
    username = f"testuser{unique_id}"

    # Create the first user
    response1 = await async_client.post(
        "/users/",
        json={
            "email": email,
            "username": username,
            "full_name": "Test User 1",
        },
    )
    assert response1.status_code == 201

    # Try to create a second user with the same email
    response2 = await async_client.post(
        "/users/",
        json={
            "email": email,
            "username": f"{username}_new",  # different username
            "full_name": "Test User 2",
        },
    )
    assert response2.status_code == 400
    assert "already exists" in response2.json()["detail"]
