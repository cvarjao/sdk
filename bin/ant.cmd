@setlocal
@echo off
call "%~dp0_bootstrap.cmd"
call "%SDK_HOME%\lib\set-ant.cmd"

call %ANT_CMD% %*

@endlocal
