@echo off

:: ======================================================================================================
:: SYSTEM PROVISIONING SCRIPT
:: ======================================================================================================

:: ======================================================================================================
:: This command automatically registers these variables as System Environment Variables.
:: ======================================================================================================

:: ======================================================================================================
:: Import the theme logic
:: ======================================================================================================

call "%~dp0lib\theme.bat"

:: Run the Admin check and watch for the exit code
call "%~dp0lib\check-admin.bat"

if %errorlevel% NEQ 0 exit /b

SET "SYS_ENV_CONF=%~dp0config\env-spec.win.conf"
SET "SYS_ENV_SETUP=%~dp0lib\sys-env\setup.bat"

:MENU
cls
echo %CYAN%==================================================%RESET%
echo        SYSTEM ENVIRONMENT VARIABLE MANAGER
echo %CYAN%==================================================%RESET%
echo 1. Import from Configuration File%YELLOW% (%SYS_ENV_CONF%)%RESET%
echo 2. Add Variable Manually
echo 3. Exit
echo.
set /p choice="Choose an option (1-3): "

:: If they typed nothing, just loop back silently
if "%choice%" == "" goto :MENU

if "%choice%" == "1" (
    CALL :CHOICE1
    exit /b    
)

if "%choice%" == "2" echo LOGIC NOT YET CREATED & GOTO :MENU
if "%choice%" == "3" exit /b 

:: The "Catch-All" for invalid text/numbers
echo.
echo %RED%Error: [%choice%] is not a valid option.%RESET%
echo Press any key to try again...
pause >nul
goto :MENU

:: Import variable from File
:CHOICE1
    echo.
    echo %YELLOW%Have you finalized the configuration file?%RESET%
    echo [Y] Yes, proceed with import
    echo [N] No, return to menu
    echo.

    choice /c YN /n /m "Select (Y/N): "
    if errorlevel 2 GOTO :MENU
    
    if errorlevel 1 CALL "%SYS_ENV_SETUP%" "%SYS_ENV_CONF%" &  pause >nul
exit /b
