@echo off
title Boirong Cash Memo - Windows EXE Installer Builder
cd /d "%~dp0"
echo ============================================================
echo   Boirong Cash Memo - Windows .EXE Installer Builder
echo ============================================================
echo.

where node >nul 2>nul
if %errorlevel% neq 0 (
    echo [ERROR] Node.js is not installed on this Windows PC.
    echo Please download and install Node.js LTS from: https://nodejs.org/
    echo After installing Node.js, double-click BUILD_EXE.bat again.
    pause
    exit /b 1
)

echo [1/2] Installing Electron and EXE Builder dependencies...
call npm install
if %errorlevel% neq 0 (
    echo [ERROR] npm install failed. Check your internet connection and retry.
    pause
    exit /b 1
)

echo.
echo [2/2] Building Windows Setup (.exe) Installer...
call npm run build:exe
if %errorlevel% neq 0 (
    echo [ERROR] Build failed.
    pause
    exit /b 1
)

echo.
echo ============================================================
echo   SUCCESS! Your .exe installer is ready inside the "dist" folder!
echo ============================================================
if exist "dist" start "" "dist"
pause
