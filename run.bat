@echo off
title laundry-app
cd /d "%~dp0"

echo === Installing backend (lanbac) ===
cd /d "%~dp0lanbac"
call npm install

echo.
echo === Installing frontend (lanfro) ===
cd /d "%~dp0lanfro"
call npm install

echo.
echo === Formatting (lanbac) ===
cd /d "%~dp0lanbac"
call npm run format 2>nul
if %ERRORLEVEL% NEQ 0 echo No format script

echo === Linting (lanbac) ===
call npm run lint 2>nul
if %ERRORLEVEL% NEQ 0 echo No lint script

echo.
echo === Starting backend (lanbac) ===
start "laundry-backend" cmd /c "cd /d "%~dp0lanbac" && npm run watch"

echo === Starting frontend (lanfro) ===
cd /d "%~dp0lanfro"
call npm run start

pause
