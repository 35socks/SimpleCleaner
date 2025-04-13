@echo off
:: coded by cam (https://cmb.social)
:: Check if the script is running with admin privileges
openfiles >nul 2>nul
if %errorlevel% NEQ 0 (
    echo This script requires administrator privileges. Please run as administrator.
    pause
    exit
)

:: Clean temp files
echo Deleting temporary files...
del /q /f /s %temp%\* >nul
del /q /f /s C:\Windows\Temp\* >nul

:: Clean the Windows Prefetch folder
echo Deleting Prefetch files...
del /q /f /s C:\Windows\Prefetch\* >nul

:: Clean the Internet Explorer cache (if applicable)
echo Deleting Internet Explorer cache...
RunDll32.exe InetCpl.cpl,ClearMyTracksByProcess 8

:: Clean Windows Update files (optional, requires extra care)
echo Deleting Windows Update files...
rd /s /q C:\Windows\SoftwareDistribution\Download

:: Clean the Recycle Bin
echo Emptying the Recycle Bin...
rd /s /q C:\$Recycle.Bin

echo Cleanup completed!
pause
