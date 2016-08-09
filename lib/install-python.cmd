@setlocal
@echo off

IF NOT EXIST %SDK_HOME%\usr\lib\python.version.txt GOTO LoadDefaultVersion
set /p PYTHON_VERSION=<%SDK_HOME%\usr\lib\python.version.txt
GOTO SetHome

:LoadDefaultVersion
set /p PYTHON_VERSION=<%SDK_HOME%\etc\defaults\python.version.txt

:SetHome
set "PYTHON_HOME=%SDK_HOME%\usr\lib\python\%PYTHON_VERSION%"

IF EXIST %PYTHON_HOME% GOTO Done

:Install
  @REM echo Installing Python  %PYTHON_VERSION% at %PYTHON_HOME%
  call "%~dp0set-javahome.cmd"
  call %JAVA_HOME%\bin\jjs -scripting %SDK_HOME%\lib\install-python.js
  
:Done

@endlocal