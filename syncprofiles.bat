@echo off
REM EVE Online Profile Sync
REM v 0.91

setlocal enableextensions disabledelayedexpansion
REM SET THIS TO YOUR EVE-DIRECTORY!! WILL BE REPLACED BY A CONFIG FILE LATER
set "root=C:\Users\swingfish\AppData\Local\CCP\EVE\c_eve_sharedcache_tq_tranquility\settings_Default\"

SET "backupDir=%root%_backup"
REM mkdir "%backupDir%" 2>nul

REM Copy everything to the backup directory excluding _backup
REM xcopy "%root%*" "%backupDir%" /E /I /Y /EXCLUDE:%~dp0exclude.txt >nul

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

ECHO Newest User file: "%NewestFileUserFile%"
ECHO Newest Character File: "%NewestFileCharfile%"
ECHO --

REM Prompt to continue
choice /C YN /M "Do you want to continue?"
IF errorlevel 2 GOTO :eof


FOR %%a in ("%root%core_user_*.dat") DO (
    FOR /f "tokens=2 delims=0123456789" %%b in ("x%%~nxa") DO (
REM         @echo Replacing "%%~a" with "%NewestFileUser%"
        COPY /Y "%NewestFileUser%" "%%~dpnxa"
REM        @echo "#%%~a#"
    )
)

FOR %%a in ("%root%core_char_*.dat") DO (
    FOR /f "tokens=2 delims=0123456789" %%b in ("x%%~nxa") DO (
REM         @echo Replacing "%%~a" with "%NewestFileChar%"
        COPY /Y "%NewestFileChar%" "%%~dpnxa"
REM        @echo "#%%~a#"
    )
)

ECHO All good.
