#!/bin/bash

echo "🚀 Instagram Scraper MERN Stack - Quick Setup"
echo "=============================================="
echo ""

# Colors for output
RED='\033[0;31m'
GREEN='\033[0;32m'
YELLOW='\033[1;33m'
NC='\033[0m' # No Color

# Check if Node.js is installed
if ! command -v node &> /dev/null; then
    echo -e "${RED}❌ Node.js is not installed. Please install Node.js first.${NC}"
    exit 1
fi

# Check if MongoDB is installed
if ! command -v mongod &> /dev/null; then
    echo -e "${YELLOW}⚠️  MongoDB is not installed. Please install MongoDB.${NC}"
    echo "You can install MongoDB from: https://www.mongodb.com/try/download/community"
fi

echo -e "${GREEN}✅ Node.js found: $(node --version)${NC}"
echo ""

# Backend Setup
echo "📦 Setting up Backend..."
cd backend
npm install
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Backend dependencies installed${NC}"
else
    echo -e "${RED}❌ Backend installation failed${NC}"
    exit 1
fi
cd ..

echo ""

# Frontend Setup
echo "📦 Setting up Frontend..."
cd frontend
npm install
if [ $? -eq 0 ]; then
    echo -e "${GREEN}✅ Frontend dependencies installed${NC}"
else
    echo -e "${RED}❌ Frontend installation failed${NC}"
    exit 1
fi
cd ..

echo ""
echo -e "${GREEN}✅ Setup Complete!${NC}"
echo ""
echo "📝 Next Steps:"
echo "1. Start MongoDB: mongod"
echo "2. Start Backend: cd backend && npm start"
echo "3. Start Frontend (new terminal): cd frontend && npm start"
echo ""
echo "🌐 Access the app at: http://localhost:3000"
echo "🔧 API will run at: http://localhost:5000"
echo ""
echo "Happy Scraping! 🎉"
