@echo off

IF NOT DEFINED PYTHON_CMD GOTO SetHome
GOTO Done

:SetHome
  call "%~dp0set-javahome.cmd"
  for /f "tokens=*" %%i in ('jjs -scripting %SDK_HOME%\lib\install-python.js') do set "PYTHON_HOME=%%i"
  set "PATH=%PYTHON_HOME%;%PYTHON_HOME%\Scripts;%PATH%"
  set "PYTHON_CMD=%PYTHON_HOME%\python.exe"
  GOTO:eof

:Done
