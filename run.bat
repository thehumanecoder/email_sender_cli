@echo off

REM Function to display help
:show_help
echo Usage: process_args.bat --file <file> --sender <email> --to <email> --subject <subject>
echo.
echo Options:
echo   --file <file>      Path to the text file
echo   --sender <email>  Sender email address
echo   --to <email>      Recipient email address
echo   --subject <subject> Subject of the email
echo   -h, --help         Show this help message
exit /b

REM Process options and arguments
:parse_arguments
set "FILE="
set "SENDER="
set "TO="
set "SUBJECT="

:loop
if "%~1"=="" goto end_parse
if "%~1"=="-h" (
    call :show_help
    exit /b
)
if "%~1"=="--help" (
    call :show_help
    exit /b
)
if "%~1"=="--file" (
    set "FILE=%~2"
    shift /2
    goto loop
)
if "%~1"=="--sender" (
    set "SENDER=%~2"
    shift /2
    goto loop
)
if "%~1"=="--to" (
    set "TO=%~2"
    shift /2
    goto loop
)
if "%~1"=="--subject" (
    set "SUBJECT=%~2"
    shift /2
    goto loop
)
echo Unknown option: %~1
call :show_help
exit /b

:end_parse

REM Check if all required arguments are provided
if "%FILE%"=="" (
    echo Error: Missing required argument --file.
    call :show_help
    exit /b
)
if "%SENDER%"=="" (
    echo Error: Missing required argument --sender.
    call :show_help
    exit /b
)
if "%TO%"=="" (
    echo Error: Missing required argument --to.
    call :show_help
    exit /b
)
if "%SUBJECT%"=="" (
    echo Error: Missing required argument --subject.
    call :show_help
    exit /b
)

REM Delete the token.json file
if exist "token.json" (
    del "token.json"
    echo Deleted token.json file.
) else (
    echo No token.json file found to delete.
)

REM Create and activate virtual environment
if not exist "venv" (
    python -m venv venv
    echo Created virtual environment.
) else (
    echo Virtual environment already exists.
)
call venv\Scripts\activate
echo Activated virtual environment.

REM Install dependencies from requirements.txt
if exist "requirements.txt" (
    pip install -r requirements.txt
    echo Installed dependencies from requirements.txt.
) else (
    echo No requirements.txt file found.
)

REM Run the main.py script with the provided arguments
python main.py --file "%FILE%" --sender "%SENDER%" --to "%TO%" --subject "%SUBJECT%"
