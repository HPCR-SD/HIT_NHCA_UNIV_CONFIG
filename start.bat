@echo off

rem echo "Copying to C:\"
rem xcopy "%~dp0" "C:\HIT_NHCA_UNIV_CONFIG" /v /q /i /e /y
rem if not errorlevel 0 (
rem	echo "Copy failed! Please confirm you've run as an administrator and try again."
rem	echo "Script will now close. Please rerun to try again"
rem	pause
rem	exit
rem )

powershell.exe -ExecutionPolicy Bypass -File .\logic.ps1
