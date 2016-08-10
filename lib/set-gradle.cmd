@echo off

IF NOT DEFINED PYTHON_CMD GOTO SetPath
GOTO Done

:SetPath
IF DEFINED GRADLE_VERSION GOTO SetHome

IF NOT EXIST %SDK_HOME%\usr\lib\gradle.version.txt GOTO LoadDefaultVersion
set /p GRADLE_VERSION=<%SDK_HOME%\usr\lib\gradle.version.txt
GOTO SetHome

:LoadDefaultVersion
set /p GRADLE_VERSION=<%SDK_HOME%\etc\defaults\gradle.version.txt

:SetHome
set "GRADLE_HOME=%SDK_HOME%\usr\lib\gradle\%GRADLE_VERSION%"

IF EXIST %GRADLE_HOME% GOTO SetPath

:Install
call "%~dp0sdk-pkg-install.cmd" "gradle" "%GRADLE_VERSION%" "%GRADLE_HOME%"

:SetPath
@set "JAVA_HOME=%SDK_HOME%\var\.jre"
  
:Done
