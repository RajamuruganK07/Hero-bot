#!/bin/bash

# Hero-bot Repository Setup Script for Git Bash or Linux/Mac
echo "============================================"
echo "Hero-bot Repository - Git Setup (Git Bash)"
echo "============================================"
echo "Repository: git@github.com:RajamuruganK07/Hero-bot.git"
echo ""

# Check if we're in a git repository
if [ -d ".git" ]; then
    echo "✅ Git repository already initialized"
else
    echo "🔄 Initializing Git repository..."
    git init
fi

echo ""
echo "🔄 Adding all files..."
git add .

echo ""
echo "🔄 Creating initial commit..."
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

echo ""
echo "🔄 Adding remote repository..."
git remote add origin git@github.com:RajamuruganK07/Hero-bot.git 2>/dev/null || git remote set-url origin git@github.com:RajamuruganK07/Hero-bot.git

echo ""
echo "🔄 Setting main branch..."
git branch -M main

echo ""
echo "🔄 Pushing to GitHub..."
echo "This may prompt for authentication..."

if git push -u origin main; then
    echo ""
    echo "✅ Repository successfully pushed to GitHub!"
    echo "🌐 View at: https://github.com/RajamuruganK07/Hero-bot"
else
    echo ""
    echo "⚠️  SSH push failed, trying HTTPS..."
    git remote set-url origin https://github.com/RajamuruganK07/Hero-bot.git
    
    if git push -u origin main; then
        echo ""
        echo "✅ Repository successfully pushed to GitHub via HTTPS!"
        echo "🌐 View at: https://github.com/RajamuruganK07/Hero-bot"
    else
        echo ""
        echo "❌ Push failed. Please check:"
        echo "1. Repository permissions"
        echo "2. Authentication setup"
        echo "3. Network connection"
        echo ""
        echo "Manual commands to try:"
        echo "git remote -v"
        echo "git push -u origin main"
    fi
fi

echo ""
echo "============================================"
echo "NEXT STEPS"
echo "============================================"
echo ""
echo "🚀 To test the application:"
echo "1. Run: ./setup.bat or setup.bat (install dependencies)"
echo "2. Run: ./run-demo.bat or run-demo.bat (start demo)"
echo "3. Visit: http://localhost:3000"
echo ""
echo "📁 Repository structure:"
echo "├── backend/     - FastAPI Python backend"
echo "├── frontend/    - Next.js TypeScript frontend"
echo "├── docker-compose.yml - Full stack deployment"
echo "└── README.md    - Documentation"
echo ""
echo "GitHub Repository: https://github.com/RajamuruganK07/Hero-bot"
echo "============================================"