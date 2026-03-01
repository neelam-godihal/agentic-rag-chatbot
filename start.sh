#!/bin/bash

set -e
# 1. Run document ingestion (one-time)
python -m src.rag_doc_ingestion.ingest_docs
# 2. Start backend API in background
uvicorn src.backend.main:app --host 0.0.0.0 --port 8000 &
# 3. Start frontend (Streamlit) in foreground
streamlit run src.frontend.app.py --server.port 8501 --server.address 0.0.0.0