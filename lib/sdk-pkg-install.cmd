@setlocal
@echo off
@setlocal
  pushd "%~dp0"
  cd ..
  set "_SDK_HOME=%CD%"
  popd
@endlocal & set "_SDK_HOME=%_SDK_HOME%"

set "_INSTALL_ROOT=%_SDK_HOME%\usr\lib"
set "_INSTALL_PKG_NAME=%~1"
set "_INSTALL_PKG_VERSION=%~2"

if "%3"=="" goto SetDefaultPkgHome
:SetPkgHome
set "_INSTALL_PKG_HOME=%~3"
GOTO CheckInstall

:SetDefaultPkgHome
set "_INSTALL_PKG_HOME=%_INSTALL_ROOT%\%_INSTALL_PKG_NAME%\%_INSTALL_PKG_VERSION%"

:CheckInstall
IF EXIST "%_INSTALL_PKG_HOME%" GOTO Done
@REM echo Installing '%_INSTALL_PKG_NAME%' '%_INSTALL_PKG_VERSION%' at '%_INSTALL_PKG_HOME%'

@set "_JAVA_HOME=%_SDK_HOME%\var\.jre"
@set /p _JAVA_VERSION=<%_SDK_HOME%\etc\defaults\private-jre.version.txt
IF EXIST "%_SDK_HOME%\usr\lib\private-jre.version.txt" set /p _JAVA_VERSION=<%_SDK_HOME%\usr\lib\private-jre.version.txt

IF EXIST "%_JAVA_HOME%" GOTO DoInstall

:InstallJava
where powershell > NUL 2>&1 || GOTO NoPowerShell

powershell -Version 2.0 -ExecutionPolicy Bypass -File "%_SDK_HOME%\lib\install-local-jre.ps1" "%_JAVA_VERSION%"

:DoInstall
call %_JAVA_HOME%\bin\jjs -scripting "%_SDK_HOME%\lib\install-%_INSTALL_PKG_NAME%.js" -- "%_INSTALL_PKG_VERSION%" "%_INSTALL_PKG_HOME%"

GOTO Done

:NoPowerShell
echo PowerShell 2.0+ is required!
exit /b 0

:Done
@endlocal