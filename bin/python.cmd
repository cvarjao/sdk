@setlocal
@echo off
call "%~dp0\..\lib\_bootstrap.cmd"
call "%SDK_HOME%\lib\set-python.cmd"

call %PYTHON_CMD% %*

@endlocal
