@echo off
echo ============================================
echo Hero Tutor - Quick Demo Setup
echo ============================================
echo.

echo This will run a simplified version of Hero Tutor
echo Perfect for evaluation and demonstration!
echo.

echo [1/3] Setting up frontend environment...
if not exist "frontend\.env.local" (
    copy frontend\.env.example frontend\.env.local
    echo Frontend environment configured!
) else (
    echo Frontend environment already exists.
)
echo.

echo [2/3] Installing frontend dependencies...
cd frontend
if not exist "node_modules" (
    echo Installing Node.js dependencies...
    npm install
) else (
    echo Dependencies already installed.
)
cd ..
echo.

echo [3/3] Starting Hero Tutor Demo...
echo.
echo Starting Backend (Demo Mode)...
start "Hero Tutor Backend Demo" cmd /k "cd backend && python -m uvicorn app.main_demo:app --reload --host 0.0.0.0 --port 8000"

echo Waiting for backend to start...
timeout /t 5 /nobreak > nul

echo Starting Frontend...
start "Hero Tutor Frontend" cmd /k "cd frontend && npm run dev"

echo.
echo ============================================
echo Hero Tutor Demo is Starting!
echo ============================================
echo Frontend: http://localhost:3000
echo Backend API: http://localhost:8000  
echo API Demo: http://localhost:8000/docs
echo.
echo Note: This is a demo version with:
echo ✓ Beautiful frontend interface
echo ✓ Working API endpoints
echo ✓ Demo chat functionality
echo ✓ Sample achievements system
echo.
echo For full functionality, add your Gemini API key
echo and set up MongoDB + Qdrant databases.
echo ============================================

timeout /t 8 /nobreak > nul
echo Opening Hero Tutor in browser...
start http://localhost:3000

pause