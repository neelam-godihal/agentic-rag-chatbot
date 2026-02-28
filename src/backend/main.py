import logging
from fastapi import FastAPI
import uvicorn
from src.backend.api.chat import router as chat_router
from src.backend.config.backend_settings import Settings

logger = logging.getLogger(__name__)
logging.basicConfig(
    level=logging.INFO,
    format="%(asctime)s [%(levelname)s] %(name)s: %(message)s"
)

app = FastAPI()
app.include_router(chat_router)

settings = Settings()

if __name__ == "__main__":
    uvicorn.run(
        "src.backend.main:app",
        host=settings.API_HOST,
        port=settings.API_PORT
    )