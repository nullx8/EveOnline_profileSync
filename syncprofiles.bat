@echo off
setlocal enableextensions disabledelayedexpansion
set "root=C:\Users\swingfish\AppData\Local\CCP\EVE\c_eve_sharedcache_tq_tranquility\settings_Default\"

set "backupDir=%root%_backup"
rem mkdir "%backupDir%" 2>nul

REM Copy everything to the backup directory excluding _backup
rem xcopy "%root%*" "%backupDir%" /E /I /Y /EXCLUDE:%~dp0exclude.txt >nul

FOR /F "eol=| delims=" %%I IN ('DIR /B /A-D /O-D /TW "%root%core_user_*.dat" 2^>nul') DO (
    SET "NewestFileUser=%root%%%I"
    SET "NewestFileUserFile=%%I"
    GOTO FoundUser
)
:FoundUser

FOR /F "eol=| delims=" %%I IN ('DIR /B /A-D /O-D /TW "%root%core_char_*.dat" 2^>nul') DO (
    SET "NewestFileChar=%root%%%I"
    SET "NewestFileCharfile=%%I"
    GOTO FoundChar
)
:FoundChar

echo Newest User file: "%NewestFileUserFile%"
echo Newest Character File: "%NewestFileCharfile%"
echo --

REM Prompt to continue
choice /C YN /M "Do you want to continue?"
if errorlevel 2 goto :eof


for %%a in ("%root%core_user_*.dat") do (
    for /f "tokens=2 delims=0123456789" %%b in ("x%%~nxa") do (
rem         @echo Replacing "%%~a" with "%NewestFileUser%"
        copy /Y "%NewestFileUser%" "%%~dpnxa"
rem        @echo "#%%~a#"
    )
)

for %%a in ("%root%core_char_*.dat") do (
    for /f "tokens=2 delims=0123456789" %%b in ("x%%~nxa") do (
rem         @echo Replacing "%%~a" with "%NewestFileChar%"
        copy /Y "%NewestFileChar%" "%%~dpnxa"
rem        @echo "#%%~a#"
    )
)

echo All good.