FROM python:3.11-slim

WORKDIR /app

# install system dependencies
RUN apt-get update && apt-get install -y \
    build-essential \
    && rm -rf /var/lib/apt/lists/*

# install python dependencies
COPY requirements.txt ./
RUN pip install uv
RUN uv pip install --system --no-cache-dir -r requirements.txt

# copy source code
COPY src/ ./src/
COPY docs_dir/ ./docs_dir/
COPY start.sh ./start.sh

# make the script executable
RUN chmod +x start.sh

# expose ports for backend and frontend
EXPOSE 8000 8501

# Set environment variables (can be overridden at runtime)
ENV GROQ_API_KEY="your_groq_api_key"
ENV DOCUMENTS_DIR="/app/docs_dir"
ENV VECTOR_STORE_DIR="/app/doc_vector_store"
ENV COLLECTION_NAME="document_collection"
ENV MODEL_NAME="llama-3.3-70b-versatile"
ENV MODEL_TEMPERATURE=0.0
ENV CHAT_ENDPOINT_URL="http://localhost:8000/chat/answer"

# run all services through the start up script
CMD ["/app/start.sh"]