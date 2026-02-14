@echo off
echo ========================================
echo Instagram Scraper MERN Stack - Setup
echo ========================================
echo.

REM Check if Node.js is installed
where node >nul 2>nul
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Node.js is not installed!
    echo Please install Node.js from: https://nodejs.org/
    pause
    exit /b 1
)

echo [OK] Node.js found
node --version
echo.

REM Backend Setup
echo Setting up Backend...
cd backend
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Backend installation failed
    pause
    exit /b 1
)
echo [OK] Backend dependencies installed
cd ..
echo.

REM Frontend Setup
echo Setting up Frontend...
cd frontend
call npm install
if %ERRORLEVEL% NEQ 0 (
    echo [ERROR] Frontend installation failed
    pause
    exit /b 1
)
echo [OK] Frontend dependencies installed
cd ..
echo.

echo ========================================
echo Setup Complete!
echo ========================================
echo.
echo Next Steps:
echo 1. Start MongoDB (in separate terminal): mongod
echo 2. Start Backend: cd backend ^&^& npm start
echo 3. Start Frontend (in new terminal): cd frontend ^&^& npm start
echo.
echo Access the app at: http://localhost:3000
echo API runs at: http://localhost:5000
echo.
pause
