@setlocal
@echo off
call "%~dp0\..\lib\_bootstrap.cmd"
call "%SDK_HOME%\lib\set-ant.cmd"

call %ANT_CMD% %*

@endlocal
