@echo off
call "%~dp0set-javahome.cmd"
IF NOT DEFINED SDK_VERTX_CMD GOTO SetHome

GOTO Done

:SetHome
  call "%~dp0set-javahome.cmd"
  for /f "tokens=*" %%i in ('jjs -scripting %SDK_HOME%\lib\install-vertx.js') do set "SDK_VERTX_HOME=%%i"
  set "PATH=%SDK_VERTX_HOME%\bin;%PATH%"
  set "SDK_VERTX_CMD=%SDK_VERTX_HOME%\bin\vertx"
  GOTO:eof

:Done
