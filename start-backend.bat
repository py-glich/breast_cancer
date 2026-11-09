@echo off
cd /d "%~dp0"
if not exist .venv (
  python -m venv .venv
)
call .venv\Scripts\activate.bat
pip install -r requirements.txt
if not exist ml\saved_models\breast_cancer_pipeline.joblib (
  python ml\train_model.py
  python ml\evaluate_model.py
)
uvicorn backend.main:app --reload
