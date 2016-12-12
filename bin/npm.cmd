@setlocal
@echo off
call "%~dp0\..\lib\_bootstrap.cmd"
call "%SDK_HOME%\lib\set-node.cmd"
call "%SDK_HOME%\lib\set-npm.cmd"


call %SDK_NODE_CMD% "%SDK_NPM_HOME%\node_modules\npm\bin\npm-cli.js" %*

@endlocal
