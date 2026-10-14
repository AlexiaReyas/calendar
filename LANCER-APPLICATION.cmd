@echo off
setlocal
cd /d "%~dp0"
where npm >nul 2>nul
if errorlevel 1 (
 echo Installe Node.js LTS, puis relance ce fichier.
 echo https://nodejs.org/
 pause
 exit /b 1
)
if not exist node_modules\electron\dist\electron.exe (
 call npm install --no-audit --no-fund
 if errorlevel 1 goto failed
)
call npm start
if errorlevel 1 goto failed
exit /b 0
:failed
 echo Une erreur est survenue. Copie le message affiche ci-dessus.
 pause
 exit /b 1
