@setlocal
@echo off
call "%~dp0\..\lib\_bootstrap.cmd"
call "%SDK_HOME%\lib\set-neo4j.cmd"

call %SDK_NEO4J_CMD% %*

@endlocal
