@echo off
call "%~dp0set-javahome.cmd"
IF NOT DEFINED SDK_NODE_CMD GOTO SetHome

GOTO Done

:SetHome
  call "%~dp0set-javahome.cmd"
  for /f "tokens=*" %%i in ('jjs -scripting %SDK_HOME%\lib\install-orientdb.js') do set "SDK_ORIENTDB_HOME=%%i"
  set "ORIENTDB_HOME=%SDK_ORIENTDB_HOME%"
  set "PATH=%SDK_ORIENTDB_HOME%\bin;%PATH%"
  set "SDK_ORIENTDB_SERVER_CMD=%SDK_ORIENTDB_HOME%\bin\server.bat"
  GOTO:eof

:Done
