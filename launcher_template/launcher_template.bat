@echo off
REM === 1. Close the target program if running ===
taskkill /IM program_x.exe /F >nul 2>&1

REM === 2. Wait a second (optional, for safety) ===
timeout /t 2 /nobreak >nul

REM === 3. Start the two other programs ===
start "" "D:\games\my_game/mygame.exe"

REM === 3. Wait for 30 seconds then start the other program ===
timeout /t 30 /nobreak >nul
start "" "C:\program\program_y.exe"

REM === 4. Optional: exit after launching ===
exit