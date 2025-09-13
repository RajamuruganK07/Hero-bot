@echo off
echo ============================================
echo Hero-bot Repository - Git Setup
echo ============================================
echo Repository: git@github.com:RajamuruganK07/Hero-bot.git
echo.

echo Checking for Git installation...
where git >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Git is not installed or not in PATH
    echo.
    echo Please install Git first:
    echo 1. Download from: https://git-scm.com/downloads
    echo 2. Install with default settings
    echo 3. Restart your terminal
    echo 4. Run this script again
    echo.
    goto :manual_instructions
)

echo ✅ Git is available
echo.

echo Initializing Git repository...
git init
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to initialize Git repository
    goto :manual_instructions
)
echo.

echo Adding all files to repository...
git add .
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to add files
    goto :manual_instructions
)
echo.

echo Creating initial commit...
git commit -m "Initial commit: Hero Tutor full-stack AI education platform

Features:
- FastAPI backend with Python
- Next.js frontend with TypeScript  
- MongoDB for operational data
- Qdrant for vector search
- LangChain + Gemini LLM integration
- Docker containerization
- Responsive UI with Tailwind CSS
- Gamification system
- Real-time chat interface

Tech Stack:
- Backend: FastAPI, MongoDB, Qdrant, LangChain, Gemini
- Frontend: Next.js, TypeScript, Tailwind CSS, Framer Motion
- Deployment: Docker, Docker Compose"

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to create commit
    goto :manual_instructions
)
echo.

echo Adding remote repository...
git remote add origin git@github.com:RajamuruganK07/Hero-bot.git
if %ERRORLEVEL% NEQ 0 (
    echo ⚠️  Remote might already exist, trying to set URL...
    git remote set-url origin git@github.com:RajamuruganK07/Hero-bot.git
)
echo.

echo Setting main branch...
git branch -M main
echo.

echo Pushing to GitHub...
echo This may prompt for authentication...
git push -u origin main
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Push failed. This might be due to:
    echo 1. SSH key not set up
    echo 2. Authentication issues
    echo 3. Repository permissions
    echo.
    echo Trying HTTPS instead...
    git remote set-url origin https://github.com/RajamuruganK07/Hero-bot.git
    git push -u origin main
    if %ERRORLEVEL% NEQ 0 (
        echo ❌ HTTPS push also failed
        goto :manual_instructions
    )
)

echo.
echo ✅ Repository successfully pushed to GitHub!
echo 🌐 View at: https://github.com/RajamuruganK07/Hero-bot
echo.
goto :success

:manual_instructions
echo.
echo ============================================
echo MANUAL SETUP INSTRUCTIONS
echo ============================================
echo.
echo If automatic setup failed, please run these commands manually:
echo.
echo 1. Initialize repository:
echo    git init
echo.
echo 2. Add files:
echo    git add .
echo.
echo 3. Create commit:
echo    git commit -m "Initial commit: Hero Tutor AI platform"
echo.
echo 4. Add remote (choose one):
echo    SSH: git remote add origin git@github.com:RajamuruganK07/Hero-bot.git
echo    HTTPS: git remote add origin https://github.com/RajamuruganK07/Hero-bot.git
echo.
echo 5. Push to GitHub:
echo    git branch -M main
echo    git push -u origin main
echo.
echo ============================================
echo.

:success
echo ============================================
echo NEXT STEPS
echo ============================================
echo.
echo 🚀 Your Hero Tutor code is now in the Hero-bot repository!
echo.
echo To test the application:
echo 1. Run: setup.bat (install dependencies)
echo 2. Run: run-demo.bat (start demo)
echo 3. Visit: http://localhost:3000
echo.
echo Repository structure:
echo 📁 backend/     - FastAPI Python backend
echo 📁 frontend/    - Next.js TypeScript frontend
echo 📄 docker-compose.yml - Full stack deployment
echo 📄 README.md    - Documentation
echo.
echo GitHub Repository: https://github.com/RajamuruganK07/Hero-bot
echo ============================================

pause