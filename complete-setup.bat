@echo off
echo ============================================
echo Hero-bot Repository Setup with Git
echo ============================================
echo.

echo Setting up Hero Tutor code in Hero-bot repository...
echo Repository: https://github.com/RajamuruganK07/Hero-bot.git
echo.

echo Current directory: %CD%
echo.

echo [1/5] Checking Git installation...
echo.

REM Check if git is available via different methods
"C:\Program Files\Git\bin\git.exe" --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    set "GIT_CMD=C:\Program Files\Git\bin\git.exe"
    echo ✅ Git found at: C:\Program Files\Git\bin\git.exe
    goto :git_found
)

"C:\Program Files (x86)\Git\bin\git.exe" --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    set "GIT_CMD=C:\Program Files (x86)\Git\bin\git.exe"
    echo ✅ Git found at: C:\Program Files (x86)\Git\bin\git.exe
    goto :git_found
)

git --version >nul 2>&1
if %ERRORLEVEL% EQU 0 (
    set "GIT_CMD=git"
    echo ✅ Git found in PATH
    goto :git_found
)

echo ❌ Git not found. Please ensure Git is installed.
echo Download from: https://git-scm.com/downloads
echo.
goto :manual_setup

:git_found
echo Using Git command: %GIT_CMD%
echo.

echo [2/5] Initializing Git repository...
%GIT_CMD% init
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to initialize Git repository
    goto :manual_setup
)
echo ✅ Git repository initialized
echo.

echo [3/5] Adding all files to repository...
%GIT_CMD% add .
if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to add files
    goto :manual_setup
)
echo ✅ Files added to repository
echo.

echo [4/5] Creating initial commit...
%GIT_CMD% commit -m "Initial commit: Hero Tutor AI Education Platform

🦸‍♂️ Complete Full-Stack Application:

Backend (Python + FastAPI):
- FastAPI for RESTful APIs and orchestration
- MongoDB integration for operational data
- Qdrant vector database for content search
- LangChain + Gemini LLM for AI tutoring
- Docker containerization ready

Frontend (Next.js + TypeScript):
- Next.js 14 with App Router
- TypeScript for type safety
- Tailwind CSS for responsive design
- Framer Motion for animations
- Modern component architecture

Features:
- AI-powered tutoring with Captain Knowledge
- Multi-subject support (Math, Science, English, History)
- Gamification system (points, badges, achievements)
- Real-time chat interface
- Adaptive learning algorithms
- Progress tracking and analytics
- Voice input support
- Accessibility compliance

Tech Stack:
- Backend: FastAPI, MongoDB, Qdrant, LangChain, Gemini
- Frontend: Next.js, TypeScript, Tailwind CSS, Framer Motion
- Deployment: Docker, Docker Compose
- Development: Hot reload, TypeScript, ESLint, Prettier

Ready for SIH 2024 demonstration and evaluation!"

if %ERRORLEVEL% NEQ 0 (
    echo ❌ Failed to create commit
    goto :manual_setup
)
echo ✅ Initial commit created
echo.

echo [5/5] Setting up remote repository...
%GIT_CMD% remote add origin https://github.com/RajamuruganK07/Hero-bot.git
if %ERRORLEVEL% NEQ 0 (
    echo ⚠️  Remote might already exist, updating URL...
    %GIT_CMD% remote set-url origin https://github.com/RajamuruganK07/Hero-bot.git
)

%GIT_CMD% branch -M main
echo ✅ Set main branch
echo.

echo Pushing to GitHub repository...
echo This may prompt for GitHub credentials...
echo.
%GIT_CMD% push -u origin main
if %ERRORLEVEL% EQU 0 (
    echo.
    echo ✅ Successfully pushed to GitHub!
    echo 🌐 Repository: https://github.com/RajamuruganK07/Hero-bot
    goto :success
) else (
    echo.
    echo ⚠️  Push failed. This might be due to:
    echo 1. Authentication required
    echo 2. Repository permissions
    echo 3. Network issues
    echo.
    echo Please run: %GIT_CMD% push -u origin main
    echo Or visit: https://github.com/RajamuruganK07/Hero-bot
    goto :success
)

:manual_setup
echo.
echo ============================================
echo MANUAL GIT SETUP INSTRUCTIONS
echo ============================================
echo.
echo Please run these commands manually:
echo.
echo 1. git init
echo 2. git add .
echo 3. git commit -m "Initial commit: Hero Tutor AI platform"
echo 4. git remote add origin https://github.com/RajamuruganK07/Hero-bot.git
echo 5. git branch -M main
echo 6. git push -u origin main
echo.

:success
echo.
echo ============================================
echo HERO TUTOR SETUP COMPLETE! 🎉
echo ============================================
echo.
echo 📁 Repository Location: %CD%
echo 🌐 GitHub: https://github.com/RajamuruganK07/Hero-bot
echo.
echo 🚀 Next Steps:
echo.
echo 1. Test the application:
echo    run-demo.bat
echo.
echo 2. Full setup with dependencies:
echo    setup.bat
echo.
echo 3. Docker deployment:
echo    docker-compose up -d
echo.
echo 🏗️ Project Structure:
echo ├── backend/         - FastAPI Python backend
echo ├── frontend/        - Next.js TypeScript frontend  
echo ├── docker-compose.yml - Container orchestration
echo └── README.md        - Complete documentation
echo.
echo 💡 Features Ready:
echo ✅ AI tutoring with Gemini LLM
echo ✅ MongoDB + Qdrant databases
echo ✅ Responsive UI with Tailwind CSS
echo ✅ Gamification system
echo ✅ Real-time chat interface
echo ✅ Docker containerization
echo.
echo 🎯 Perfect for SIH 2024 evaluation!
echo ============================================

pause