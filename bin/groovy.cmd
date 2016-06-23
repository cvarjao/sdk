@setlocal
@echo off
call "%~dp0_bootstrap.cmd"
call "%SDK_HOME%\lib\set-groovy.cmd"

call %GROOVY_CMD% %*

@endlocal
