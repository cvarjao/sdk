@echo off
call "%~dp0set-javahome.cmd"
IF NOT DEFINED GROOVY_CMD GOTO SetHome

GOTO Done

:SetHome
  call "%~dp0set-javahome.cmd"
  for /f "tokens=*" %%i in ('jjs -scripting %SDK_HOME%\lib\install-groovy.js') do set "GROOVY_HOME=%%i"
  set "PATH=%GROOVY_HOME%\bin;%PATH%"
  set "GROOVY_CMD=%GROOVY_HOME%\bin\groovy"
  GOTO:eof

:Done
