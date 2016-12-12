@echo off

:SetVersion
IF DEFINED NODE_VERSION GOTO SetHome
IF EXIST %SDK_HOME%\usr\lib\nodejs.version.txt GOTO SetUserVersion
IF EXIST %SDK_HOME%\etc\defaults\nodejs.version.txt GOTO SetDefaultVersion

:SetDefaultVersion
set /p NODE_VERSION=<%SDK_HOME%\etc\defaults\nodejs.version.txt
GOTO SetHome

:SetUserVersion
set /p NODE_VERSION=<%SDK_HOME%\usr\lib\nodejs.version.txt
GOTO SetHome

:SetHome
set "SDK_NODE_HOME=%SDK_HOME%\usr\lib\node\%NODE_VERSION%"

IF EXIST %SDK_NODE_HOME% GOTO SetPath

:Install
call "%~dp0sdk-pkg-install.cmd" "node" "%NODE_VERSION%" "%SDK_NODE_HOME%"

:SetPath
set "SDK_NODE_CMD=%SDK_NODE_HOME%\bin\node.exe"

:FixPath
set "SDK_NODE_CMD=%SDK_NODE_HOME%\bin\node.exe"

:Done

