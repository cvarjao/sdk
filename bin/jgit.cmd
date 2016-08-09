@setlocal
@echo off
call "%~dp0\..\lib\_bootstrap.cmd"
call "%~dp0\..\lib\set-jgit.cmd"

call "%JAVA_HOME%\bin\java" -cp "%JGIT_CLASSPATH%"  %JGIT_MAIN_CLASS% %*

@endlocal
