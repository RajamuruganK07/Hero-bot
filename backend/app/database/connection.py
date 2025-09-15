import os

from dotenv import load_dotenv
from motor.motor_asyncio import AsyncIOMotorClient

# Load environment variables from .env file
load_dotenv()

MONGODB_URI = os.getenv("MONGODB_URI")

if not MONGODB_URI:
    raise ValueError("MONGODB_URI environment variable not set")


class Database:
    def __init__(self, uri: str, database_name: str):
        self._client = AsyncIOMotorClient(uri)
        self.db = self._client[database_name]

    def get_collection(self, collection_name: str):
        return self.db[collection_name]

    def close(self):
        self._client.close()


# The database name is specified in the docker-compose.yml and .env.example
db = Database(MONGODB_URI, "hero_tutor")


def get_db():
    return db.db
