@setlocal
@echo off
call "%~dp0\..\lib\_bootstrap.cmd"
call "%SDK_HOME%\lib\set-orientdb.cmd"

cd "%SDK_ORIENTDB_HOME%"
call %SDK_ORIENTDB_SERVER_CMD% %*

@endlocal
