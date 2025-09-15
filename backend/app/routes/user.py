from fastapi import APIRouter, Depends, HTTPException, status
from motor.motor_asyncio import AsyncIOMotorDatabase
from pymongo.errors import DuplicateKeyError

from app.database.connection import get_db
from app.models.user import UserBase, UserInDB

router = APIRouter()


@router.post(
    "/",
    response_model=UserInDB,
    status_code=status.HTTP_201_CREATED,
    response_model_by_alias=False,
)
async def create_user(user: UserBase, db: AsyncIOMotorDatabase = Depends(get_db)):
    """
    Create a new user.
    """
    user_collection = db.get_collection("users")

    user_document = user.model_dump()

    try:
        result = await user_collection.insert_one(user_document)
    except DuplicateKeyError:
        raise HTTPException(
            status_code=status.HTTP_400_BAD_REQUEST,
            detail="User with this email or username already exists",
        )

    created_user = await user_collection.find_one({"_id": result.inserted_id})

    if created_user:
        return UserInDB.model_validate(created_user)

    raise HTTPException(
        status_code=status.HTTP_500_INTERNAL_SERVER_ERROR,
        detail="Could not create user.",
    )
