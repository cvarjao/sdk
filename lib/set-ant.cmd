@echo off

IF NOT DEFINED ANT_CMD GOTO SetHome
GOTO Done

:SetHome
  call "%~dp0set-javahome.cmd"
  for /f "tokens=*" %%i in ('jjs -scripting %SDK_HOME%\lib\install-ant.js') do set ANT_HOME=%%i
  set "PATH=%ANT_HOME%\bin;%PATH%"
  set "ANT_CMD=%ANT_HOME%\bin\ant"
  GOTO:eof

:Done
