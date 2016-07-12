@setlocal
@echo off
call "%~dp0\..\lib\_bootstrap.cmd"
call "%SDK_HOME%\lib\set-node.cmd"

call %SDK_NODE_CMD% %*

@endlocal
