@echo off
title laundry-app
cd /d "%~dp0"

echo === Installing backend (lanbac) ===
cd /d "%~dp0lanbac"
call pnpm install

echo.
echo === Installing frontend (lanfro) ===
cd /d "%~dp0lanfro"
call pnpm install

echo.
echo === Formatting (lanbac) ===
cd /d "%~dp0lanbac"
call pnpm run format 2>nul
if %ERRORLEVEL% NEQ 0 echo No format script

echo === Linting (lanbac) ===
call pnpm run lint 2>nul
if %ERRORLEVEL% NEQ 0 echo No lint script

echo.
echo === Starting backend (lanbac) ===
start "laundry-backend" cmd /c "cd /d "%~dp0lanbac" && pnpm run watch"

echo === Starting frontend (lanfro) ===
cd /d "%~dp0lanfro"
call pnpm run start

pause
