@echo off
setlocal enabledelayedexpansion

:: =============================================================================
:: 1. CONFIGURATION
:: =============================================================================
set "MARIA_BIN=D:\tms-dos\resources\resources\mariadb\bin"
set "EXPORT_DIR=D:\FOR EPIC PROD DATA"
set "DB_USER=root"
set "DB_PASS=password"

:: Database Targets
set "DB_MAIN=cmh_kansas_prod"
set "DB_DW=cmh_kansas_prod_dw"

:: Optimized Flags
set "DUMP_OPTS=--single-transaction --routines --triggers --events --max_allowed_packet=1G --net_buffer_length=16M"

:: =============================================================================
:: 2. INITIALIZATION
:: =============================================================================
echo Starting Cutover Export...
if not exist "%EXPORT_DIR%" mkdir "%EXPORT_DIR%"
D:
cd "%MARIA_BIN%"

:: =============================================================================
:: 3. EXECUTION: MAIN DATABASE
:: =============================================================================
echo [1/3] Dumping Main Database: %DB_MAIN%...
mysqldump.exe --user=%DB_USER% --password="%DB_PASS%" %DB_MAIN% %DUMP_OPTS% -r "%EXPORT_DIR%\%DB_MAIN%.sql"

echo [VERIFY] Last 10 lines of %DB_MAIN%:
powershell -Command "Get-Content -Path '%EXPORT_DIR%\%DB_MAIN%.sql' -Tail 10"

:: =============================================================================
:: 4. EXECUTION: DW CHANGELOG
:: =============================================================================
echo [2/3] Dumping DW Changelog: %DB_DW%...
mysqldump.exe --user=%DB_USER% --password="%DB_PASS%" %DB_DW% changelog %DUMP_OPTS% -r "%EXPORT_DIR%\%DB_DW%_changelog.sql"

echo [VERIFY] Last 10 lines of %DB_DW%_changelog:
powershell -Command "Get-Content -Path '%EXPORT_DIR%\%DB_DW%_changelog.sql' -Tail 10"

:: =============================================================================
:: 5. COMPRESSION
:: =============================================================================
echo [3/3] Compressing Folder...
set "ZIP_NAME=D:\FOR_EPIC_PROD_DATA_%DATE:~-4%%DATE:~4,2%%DATE:~7,2%.zip"

:: Use PowerShell's native Compress-Archive (No 3rd party tools needed)
powershell -Command "Compress-Archive -Path '%EXPORT_DIR%\*' -DestinationPath '%ZIP_NAME%' -Force"

if %ERRORLEVEL% EQU 0 (
    echo.
    echo ===========================================================
    echo SUCCESS: Export and Compression Complete.
    echo Location: %ZIP_NAME%
    echo ===========================================================
) else (
    echo.
    echo ERROR: Process failed during execution.
)

pause