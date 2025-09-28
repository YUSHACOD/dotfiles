@echo off

:: Launch Readeck 
start "" /B readeck serve -port 49292

:: Launch Shiori
start "" /B shiori server -p 49291

pause
