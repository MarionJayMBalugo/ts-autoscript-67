@echo off
setlocal enabledelayedexpansion

:: =============================================================================
:: 1. CONFIGURATION
:: =============================================================================
set "ENV_FILE=C:\Users\mbalugo\Documents\automation scripts\.env"
set "DB_USER=root"
set "DOCKER_CONT=wai-web-db-1"

:: COMMA-SEPARATED LIST (No spaces after commas is safest)
set "DB_LIST=a,b,c,d"

:: =============================================================================
:: 2. FAST PARSE .ENV FOR PASSWORD
:: =============================================================================
if exist "%ENV_FILE%" (
    for /f "tokens=2 delims==" %%P in ('findstr /B "DB_PASSWORD=" "%ENV_FILE%"') do (
        set "PW=%%P"
        set "PW=!PW:'=!"
        set "PW=!PW:"=!"
    )
)
if "!PW!"=="" set "PW=password"

:: =============================================================================
:: 3. EXECUTION LOOP
:: =============================================================================
echo --- Starting Batch Database Creation ---

:: Use a standard token loop. Commas in the IN clause work best when treated as a simple list.
for %%D in (%DB_LIST%) do (
    set "CURRENT_DB=%%D"
    
    :: Remove accidental spaces
    set "CURRENT_DB=!CURRENT_DB: =!"
    
    :: Only proceed if the variable isn't empty
    if not "!CURRENT_DB!"=="" (
        set "CREATE_SQL=CREATE DATABASE IF NOT EXISTS `!CURRENT_DB!` CHARACTER SET utf8mb4 COLLATE utf8mb4_unicode_ci;"
        
        echo.
        echo [PROCESS] Creating: !CURRENT_DB! ...

        :: METHOD: DOCKER (Default)
        docker exec -i -e MYSQL_PWD=!PW! %DOCKER_CONT% mysql -u %DB_USER% -e "!CREATE_SQL!"

        if !ERRORLEVEL! EQU 0 (
            echo [SUCCESS] !CURRENT_DB! is ready.
        ) else (
            echo [FAILURE] Could not create !CURRENT_DB!. Code !ERRORLEVEL!
        )
    )
)

:: =============================================================================
:: 4. CLEANUP
:: =============================================================================
echo.
echo --- Task Completed ---
set "PW="
pause