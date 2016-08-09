@echo off

IF NOT DEFINED JGIT_MAIN_CLASS GOTO SetPath
GOTO Done

:SetPath
IF DEFINED JGIT_VERSION GOTO SetHome
set /p JGIT_VERSION=<%SDK_HOME%\etc\defaults\jgit.version.txt

IF NOT EXIST %SDK_HOME%\usr\lib\jgit.version.txt GOTO SetHome
set /p JGIT_VERSION=<%SDK_HOME%\usr\lib\jgit.version.txt

:SetHome
set "JGIT_HOME=%SDK_HOME%\usr\lib\jgit\%JGIT_VERSION%"

IF EXIST %JGIT_HOME% GOTO SetPath

:Install
  call "%~dp0sdk-pkg-install.cmd" "jgit" "%JGIT_VERSION%" "%JGIT_HOME%"

:SetPath
  set "JGIT_CLASSPATH=%JGIT_HOME%\jgit-sh.jar"
  set "JGIT_MAIN_CLASS=org.eclipse.jgit.pgm.Main"
:Done
