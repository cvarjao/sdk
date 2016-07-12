@echo off
call "%~dp0set-javahome.cmd"
IF NOT DEFINED SDK_NODE_CMD GOTO SetHome

GOTO Done

:SetHome
  call "%~dp0set-javahome.cmd"
  for /f "tokens=*" %%i in ('jjs -scripting %SDK_HOME%\lib\install-node.js') do set "SDK_NODE_HOME=%%i"
  set "PATH=%SDK_NODE_HOME%\bin;%PATH%"
  set "SDK_NODE_CMD=%SDK_NODE_HOME%\bin\node.exe"
  GOTO:eof

:Done
