# Hero Tutor - Full Stack AI Education Platform

**🦸‍♂️ Your AI-powered Study Superhero for SIH 2024**

A comprehensive AI-powered educational platform built with modern technologies, featuring Captain Knowledge as your personal AI tutor.

## 🌟 Repository

**GitHub:** [https://github.com/RajamuruganK07/Hero-bot](https://github.com/RajamuruganK07/Hero-bot)  
**SSH:** `git@github.com:RajamuruganK07/Hero-bot.git`  
**HTTPS:** `https://github.com/RajamuruganK07/Hero-bot.git`

## 🚀 Quick Start (30 seconds)

```bash
# Clone the repository
git clone https://github.com/RajamuruganK07/Hero-bot.git
cd Hero-bot

# Run the demo immediately
run-demo.bat

# Visit: http://localhost:3000
```

## 🏗️ Architecture

### Backend
- **FastAPI** (Python) - RESTful APIs and orchestration
- **MongoDB** - Operational data storage
- **Qdrant** - Vector search and embeddings
- **LangChain/LangGraph** - Agentic workflows
- **Google Gemini** - Large Language Model

### Frontend
- **Next.js 14** with TypeScript
- **Tailwind CSS** - Responsive design
- **React Hook Form** - Form management
- **SWR** - Data fetching
- **Framer Motion** - Animations

### Deployment
- **Docker** containers
- **MongoDB Atlas** (cloud database)
- **Qdrant Cloud** (vector database)
- **Vercel** (frontend deployment)
- **Railway/Render** (backend deployment)

## 📁 Project Structure

```
Hero-bot/
├── backend/                    # FastAPI Python backend
│   ├── app/
│   │   ├── __init__.py
│   │   ├── main.py            # FastAPI application
│   │   ├── main_demo.py       # Demo version
│   │   ├── config.py          # Configuration settings
│   │   ├── database/          # Database connections
│   │   ├── models/            # Pydantic models
│   │   ├── routes/            # API routes
│   │   ├── services/          # Business logic
│   │   ├── agents/            # LangChain agents
│   │   └── utils/             # Utilities
│   ├── requirements.txt       # Python dependencies
│   ├── Dockerfile
│   └── .env.example
├── frontend/                   # Next.js TypeScript frontend
│   ├── src/
│   │   ├── app/               # App router (Next.js 14)
│   │   ├── components/        # Reusable components
│   │   ├── hooks/             # Custom React hooks
│   │   ├── lib/               # Utilities and API clients
│   │   ├── types/             # TypeScript types
│   │   └── styles/            # Global styles
│   ├── public/                # Static assets
│   ├── package.json
│   ├── tailwind.config.js
│   ├── next.config.js
│   └── Dockerfile
├── docker-compose.yml          # Local development setup
├── run-demo.bat               # Quick demo launcher
├── setup.bat                  # Full setup script
├── .gitignore
└── README.md
```

## 🚀 Features

### Core Functionality
- AI-powered tutoring with Gemini LLM
- Adaptive learning algorithms
- Multi-subject support (Math, Science, English, History)
- Real-time chat interface
- Voice input/output capabilities

### Gamification
- Points and achievement system
- Learning streaks and progress tracking
- Badges and levels
- Social learning features

### Technical Features
- Vector similarity search for content recommendations
- Agentic workflows for complex educational tasks
- Real-time WebSocket connections
- Responsive design for all devices
- Accessibility compliance (WCAG 2.1)

## 🛠️ Development Setup

### Prerequisites
- Python 3.11+
- Node.js 18+
- Docker and Docker Compose
- MongoDB (local or Atlas)
- Qdrant (local or cloud)

### Quick Start (Demo)

1. **Quick Demo (Recommended for Evaluation)**
   ```bash
   run-demo.bat
   ```

2. **Access the application**
   - Frontend: http://localhost:3000
   - Backend API: http://localhost:8000
   - API Docs: http://localhost:8000/docs

### Full Setup

1. **Setup and install dependencies**
   ```bash
   setup.bat
   ```

2. **Configure environment variables**
   ```bash
   # Edit backend/.env with your API keys
   # - Add Google Gemini API key
   # - Set MongoDB URI
   # - Configure Qdrant URL
   ```

3. **Start with Docker Compose**
   ```bash
   docker-compose up -d
   ```

### Manual Setup

#### Backend
```bash
cd backend
python -m venv venv
venv\Scripts\activate
pip install -r requirements.txt
uvicorn app.main:app --reload
```

#### Frontend
```bash
cd frontend
npm install
npm run dev
```

## 🔧 Configuration

### Environment Variables

#### Backend (.env)
```env
MONGODB_URI=mongodb://localhost:27017/hero_tutor
QDRANT_URL=http://localhost:6333
GOOGLE_API_KEY=your_gemini_api_key
JWT_SECRET=your_jwt_secret
CORS_ORIGINS=http://localhost:3000
```

#### Frontend (.env.local)
```env
NEXT_PUBLIC_API_URL=http://localhost:8000
NEXT_PUBLIC_WS_URL=ws://localhost:8000
```

## 📊 API Documentation

The FastAPI backend provides interactive API documentation at `/docs` when running in development mode.

### Key Endpoints
- `POST /auth/login` - User authentication
- `GET /chat/history` - Chat history
- `POST /chat/message` - Send message to AI tutor
- `GET /progress/stats` - User learning statistics
- `POST /achievements/unlock` - Achievement system

## 🧪 Testing

### Backend Tests
```bash
cd backend
pytest
```

### Frontend Tests
```bash
cd frontend
npm run test
```

## 🚀 Deployment

### Production Deployment
1. Build Docker images
2. Deploy to cloud platforms
3. Configure environment variables
4. Set up monitoring and logging

### Monitoring
- Health checks for all services
- Performance monitoring
- Error tracking
- User analytics

## 🤝 Contributing

1. Fork the repository
2. Create a feature branch
3. Make changes with tests
4. Submit a pull request

## 📄 License

MIT License - see LICENSE file for details.

---

## SIH 2024 - Team Information

**Problem Statement**: AI-powered educational platform for personalized learning
**Technology Stack**: FastAPI, Next.js, MongoDB, Qdrant, LangChain, Gemini
**Team**: Hero Tutor Team
**Category**: Software

## 🎯 Hero Tutor Features

### 🦸‍♂️ Meet Captain Knowledge
Your AI superhero tutor who makes learning fun and engaging!

### 🎮 Gamification
- Earn points for correct answers
- Unlock achievements and badges
- Maintain learning streaks
- Compete on leaderboards

### 🧠 Smart Learning
- Adaptive difficulty based on performance
- Personalized content recommendations
- Multi-modal learning (text, voice, visual)
- Progress tracking and analytics

### 📱 Modern Interface
- Responsive design for all devices
- Real-time chat with AI tutor
- Beautiful superhero-themed UI
- Accessibility-first approach