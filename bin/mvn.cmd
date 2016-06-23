@setlocal
@echo off
call "%~dp0_bootstrap.cmd"
call "%SDK_HOME%\lib\set-maven.cmd"

call %MVN_CMD% %*

@endlocal
