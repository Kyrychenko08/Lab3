@echo off
setlocal enabledelayedexpansion

set /p "directory=Enter the directory path: "

set /p "subdirectory=Enter the subdirectory name: "

if not exist "%directory%" (
    echo Directory "%directory%" not found.
    exit /b 1
)

cd /d "%directory%"

for /d %%d in (*) do (
    set "attribs=%%~ad"
    if "%%~nd"=="%subdirectory%" (
        echo Subdirectory named "%subdirectory%" found: "%%~fd"
        echo Attributes: !attribs!
        set found=true
    )
)

if not defined found (
    echo Subdirectory named "%subdirectory%" not found in directory "%directory%".
    exit /b 1
)
exit /b 0
