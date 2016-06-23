@setlocal
@echo off
pushd "%~dp0"
cd ..
set "_SDK_HOME=%CD%"
popd
@endlocal & set "SDK_HOME=%_SDK_HOME%"