from dotenv import load_dotenv
from pydantic_settings import BaseSettings

load_dotenv()

class DocIngestionSettings(BaseSettings):
    DOCUMENTS_DIRECTORY: str
    VECTOR_STORE_DIRECTORY: str
    VECTOR_STORE_NAME: str

    class Config:
        env_file = ".env"
        env_file_encoding = "utf-8"
        extra = "allow"