@setlocal
@echo off

cd /d %~dp0
cd ..
set "_SDK_HOME=%CD%"
@set /p _SDK_GIT_REMOTE_URL=<%_SDK_HOME%\etc\defaults\sdk.git.remote.txt

call bin\jgit init
call bin\jgit remote add origin "%_SDK_GIT_REMOTE_URL%"
call bin\jgit fetch
@REM We need to do it twice. Sometimes the first one fails, and leave stuff behind.
call bin\jgit reset --hard origin/master > NUL 2>&1
call bin\jgit reset --hard origin/master
pause
@endlocal
