@setlocal
@echo off
call "%~dp0_bootstrap.cmd"
call "%SDK_HOME%\lib\set-vertx.cmd"

call %SDK_VERTX_CMD% %*

@endlocal
