@echo off
echo ============================================
echo Hero Tutor (Hero-bot) - Setup Script
echo ============================================
echo.

echo Setting up Hero Tutor repository...
echo This repository contains the complete full-stack application.
echo.

echo [1/4] Setting up environment files...
if not exist "backend\.env" (
    copy backend\.env.example backend\.env
    echo Backend .env file created from template
) else (
    echo Backend .env file already exists
)

if not exist "frontend\.env.local" (
    copy frontend\.env.example frontend\.env.local
    echo Frontend .env.local file created from template  
) else (
    echo Frontend .env.local file already exists
)
echo.

echo [2/4] Installing backend dependencies...
echo Note: Make sure Python 3.11+ is installed
cd backend
python -m pip install --upgrade pip
pip install -r requirements.txt
cd ..
echo Backend dependencies installed!
echo.

echo [3/4] Installing frontend dependencies...
echo Note: Make sure Node.js 18+ is installed
cd frontend
npm install
cd ..
echo Frontend dependencies installed!
echo.

echo [4/4] Setup complete!
echo.
echo ============================================
echo NEXT STEPS:
echo ============================================
echo 1. Edit backend\.env file:
echo    - Add your Google Gemini API key to GOOGLE_API_KEY
echo    - Update JWT_SECRET with a secure secret
echo    - Configure MongoDB and Qdrant URLs if needed
echo.
echo 2. Run the application:
echo    - Quick Demo: run-demo.bat
echo    - Full Setup: docker-compose up -d
echo.
echo ============================================
echo Repository Structure:
echo ============================================
echo backend/         - FastAPI Python backend
echo frontend/        - Next.js TypeScript frontend  
echo docker-compose.yml - Container orchestration
echo ============================================
pause