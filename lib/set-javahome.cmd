@echo off

@setlocal
  @echo off
  pushd "%~dp0"
  cd ..
  set "_JAVA_HOME=%CD%\var\.jre"
  popd
@endlocal & set "JAVA_HOME=%_JAVA_HOME%"

IF EXIST "%JAVA_HOME%" GOTO CheckPath

call "%~dp0\install-local-jre.cmd"

:CheckPath
echo %PATH% | find /C /I "%JAVA_HOME%" > NUL 2>&1 && GOTO Done

GOTO SetJavaHome
:SetJavaHome
  
  set "PATH=%JAVA_HOME%\bin;%PATH%"
  GOTO:eof
:Done
