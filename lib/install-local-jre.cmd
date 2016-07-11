@setlocal

@setlocal
@echo off
pushd "%~dp0"
cd ..
set "_SDK_HOME=%CD%"
popd
@endlocal & set "SDK_HOME=%_SDK_HOME%"

IF EXIST "%SDK_HOME%\var\.jre" GOTO Done

where powershell > NUL 2>&1 || GOTO NoPowerShell

@REM echo Intsalling Java
powershell -Version 2.0 -ExecutionPolicy Bypass -File "%SDK_HOME%\lib\install-local-jre.ps1"
GOTO Done

:NoPowerShell
echo PowerShell is required!
exit /b 0

:Done

@endlocal
