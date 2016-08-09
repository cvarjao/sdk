@setlocal
@echo off
call "%~dp0\..\lib\_bootstrap.cmd"
call "%SDK_HOME%\lib\set-node.cmd"
if EXIST "%SDK_NODE_HOME%\node_modules\grunt" GOTO RUN_GRUNT
:INSTALL_GRUNT
pushd "%SDK_NODE_HOME%"
call %SDK_NODE_CMD% "%SDK_NODE_HOME%\node_modules\npm\bin\npm-cli.js" install grunt
popd

:RUN_GRUNT
call %SDK_NODE_CMD% "%SDK_NODE_HOME%\node_modules\grunt\bin\grunt" %*

@endlocal
