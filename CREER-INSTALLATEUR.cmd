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
call npm install --no-audit --no-fund
if errorlevel 1 goto failed
call npm run dist
if errorlevel 1 goto failed
 echo Installateur cree dans le dossier release.
 explorer "%~dp0release"
 pause
 exit /b 0
:failed
 echo Construction interrompue. Copie le message affiche ci-dessus.
 pause
 exit /b 1
