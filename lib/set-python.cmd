@echo off

IF NOT DEFINED PYTHON_CMD GOTO SetPath
GOTO Done

:SetPath
IF DEFINED PYTHON_VERSION GOTO SetHome

IF NOT EXIST %SDK_HOME%\usr\lib\python.version.txt GOTO LoadDefaultVersion
set /p PYTHON_VERSION=<%SDK_HOME%\usr\lib\python.version.txt
GOTO SetHome

:LoadDefaultVersion
set /p PYTHON_VERSION=<%SDK_HOME%\etc\defaults\python.version.txt

:SetHome
set "PYTHON_HOME=%SDK_HOME%\usr\lib\python\%PYTHON_VERSION%"

IF EXIST %PYTHON_HOME% GOTO SetPath

:Install
  call "%~dp0sdk-pkg-install.cmd" "python" "%PYTHON_VERSION%" "%PYTHON_HOME%"

:SetPath
  set "PATH=%PYTHON_HOME%;%PYTHON_HOME%\Scripts;%PATH%"
  set "PYTHON_CMD=%PYTHON_HOME%\python.exe"
  
:Done
