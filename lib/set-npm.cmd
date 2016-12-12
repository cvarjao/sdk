@echo off

:SetVersion
IF DEFINED NPM_VERSION GOTO SetHome
IF EXIST %SDK_HOME%\usr\lib\npm.version.txt GOTO SetUserVersion
IF EXIST %SDK_HOME%\etc\defaults\npm.version.txt GOTO SetDefaultVersion


echo NPM_VERSION=%NPM_VERSION%
:SetDefaultVersion
set /p NPM_VERSION=<%SDK_HOME%\etc\defaults\npm.version.txt
GOTO SetHome

:SetUserVersion
set /p NPM_VERSION=<%SDK_HOME%\usr\lib\npm.version.txt
GOTO SetHome

:SetHome
set "SDK_NPM_HOME=%SDK_HOME%\usr\lib\npm\%NPM_VERSION%"

IF EXIST %SDK_NPM_HOME% GOTO SetPath

:Install
call "%~dp0sdk-pkg-install.cmd" "npm" "%NPM_VERSION%" "%SDK_NPM_HOME%"

:SetPath

:FixPath
set "SDK_NPM_CMD=%SDK_NPM_HOME%\npm.cmd"

:Done

