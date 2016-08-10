@setlocal
@echo off
call "%~dp0\..\lib\_bootstrap.cmd"
call "%SDK_HOME%\lib\set-gradle.cmd"

call "%GRADLE_HOME%\bin\gradle.bat" %*

@endlocal
