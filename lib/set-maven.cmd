@echo off
IF NOT DEFINED MVN_CMD GOTO SetHome
GOTO Done
:SetHome
  call "%~dp0set-javahome.cmd"
  for /f "tokens=*" %%i in ('jjs -scripting %SDK_HOME%\lib\install-maven.js') do set MAVEN_HOME=%%i
  set "PATH=%MAVEN_HOME%\bin;%PATH%"
  set "MVN_CMD=%MAVEN_HOME%\bin\mvn"
  GOTO:eof

:Done
