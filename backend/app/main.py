from contextlib import asynccontextmanager

from fastapi import FastAPI

from app.database.connection import db
from app.routes import user as user_router


@asynccontextmanager
async def lifespan(app: FastAPI):
    # on startup
    await db.db.users.create_index("email", unique=True)
    await db.db.users.create_index("username", unique=True)
    yield
    # on shutdown
    db.close()


app = FastAPI(
    title="Hero Tutor API",
    description="API for the Hero Tutor AI-powered educational platform.",
    version="0.1.0",
    lifespan=lifespan,
)

app.include_router(user_router.router, prefix="/users", tags=["users"])


@app.get("/")
def read_root():
    """
    Root endpoint to check if the API is running.
    """
    return {"message": "Welcome to the Hero Tutor API!"}
