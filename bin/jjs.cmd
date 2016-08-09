@setlocal
@echo off
call "%~dp0\..\lib\_bootstrap.cmd"
call "%~dp0\..\lib\set-javahome.cmd"
call %JAVA_HOME%\bin\jjs %*

@endlocal
