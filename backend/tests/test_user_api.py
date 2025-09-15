import pytest
from httpx import AsyncClient, ASGITransport
from app.main import app
from app.database.connection import get_db
from motor.motor_asyncio import AsyncIOMotorClient
import pytest_asyncio

# Mark all tests in this module as asyncio
pytestmark = pytest.mark.asyncio

TEST_MONGODB_URI = "mongodb://admin:password123@localhost:27017/?authSource=admin"
TEST_DB_NAME = "hero_tutor_test"

@pytest_asyncio.fixture(scope="function")
async def async_client():
    """
    Fixture to provide a test client with a dedicated test database
    that is created and destroyed for each test function.
    """
    # Setup: create client and db, create indexes
    client = AsyncIOMotorClient(TEST_MONGODB_URI)
    db = client[TEST_DB_NAME]
    await db.users.create_index("email", unique=True)
    await db.users.create_index("username", unique=True)

    # Override dependency to just return the db
    async def override_get_db_simple():
        yield db

    app.dependency_overrides[get_db] = override_get_db_simple

    # Yield the test client
    async with AsyncClient(transport=ASGITransport(app=app), base_url="http://test") as api_client:
        yield api_client

    # Teardown: drop database, clean up override
    await client.drop_database(TEST_DB_NAME)
    client.close()
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
            "username": f"{username}_new", # different username
            "full_name": "Test User 2",
        },
    )
    assert response2.status_code == 400
    assert "already exists" in response2.json()["detail"]
