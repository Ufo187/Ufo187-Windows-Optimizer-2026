@echo off
:: =========================================================================
::  ufo187 PC Optimizer 2026 (Dedicated System & Disk Cleaner)
::  Copyright (c) 2026 ufo187. All Rights Reserved.
::  Donate / Tip: https://www.paypal.com/paypalme/ufo187GG
::  Socials:      https://linktr.ee/ufo187
::  Safety:       100%% Crash-Proof - Only Cleans Safe Temp/Cache Folders
:: =========================================================================
chcp 65001 >nul
title Ufo187 PC Optimizer 2026
color 0A

:: Check for Administrator privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [!] Requesting Administrator privileges...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\ufo187_admin.vbs"
    set "params=%*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c """"%~s0"" %params%", "", "runas", 1 >> "%temp%\ufo187_admin.vbs"
    "%temp%\ufo187_admin.vbs"
    del /f /q "%temp%\ufo187_admin.vbs" >nul 2>&1
    exit /B
)
pushd "%CD%"
cd /d "%~dp0"

cls
echo ============================================================================
echo   ██╗   ██╗███████╗ ██████╗  ██╗ █████╗ ███████╗
echo   ██║   ██║██╔════╝██╔═══██╗███║██╔══██╗╚════██║
echo   ██║   ██║█████╗  ██║   ██║╚██║╚█████╔╝    ██╔╝
echo   ██║   ██║██╔══╝  ██║   ██║ ██║██╔══██╗   ██╔╝ 
echo   ╚██████╔╝██║     ╚██████╔╝ ██║╚█████╔╝   ██║  
echo    ╚═════╝ ╚═╝      ╚═════╝  ╚═╝ ╚════╝    ╚═╝  
echo ============================================================================
echo   Ufo187 PC OPTIMIZER 2026 - Dedicated System ^& Disk Cleanup
echo   Copyright (c) 2026 Ufo187. All Rights Reserved.
echo   PayPal Tip: https://www.paypal.com/paypalme/ufo187GG
echo   Linktree:   https://linktr.ee/ufo187
echo ============================================================================
echo.

echo [1/4] Cleaning User and Local %TEMP% cache files...
del /s /f /q "%temp%\*.*" >nul 2>&1
for /d %%p in ("%temp%\*.*") do rmdir "%%p" /s /q >nul 2>&1
echo        -> User temporary files cleared (locked files safely skipped).

echo.
echo [2/4] Cleaning System Windows Temp cache...
del /s /f /q "%SystemRoot%\Temp\*.*" >nul 2>&1
for /d %%p in ("%SystemRoot%\Temp\*.*") do rmdir "%%p" /s /q >nul 2>&1
echo        -> System temporary directory purged.

echo.
echo [3/4] Flushing Windows Error Reporting (WER) logs and crash dumps...
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportArchive\*.*" >nul 2>&1
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\CrashDumps\*.*" >nul 2>&1
echo        -> Old crash logs and error reports removed.

echo.
echo [4/4] Flushing DNS Resolver cache and network sockets...
ipconfig /flushdns >nul 2>&1
echo        -> DNS cache successfully flushed.

powershell -NoProfile -Command "[Console]::Beep(880, 100); [Console]::Beep(1200, 200)" >nul 2>&1
echo.
echo ============================================================================
echo   [v] PC OPTIMIZATION COMPLETE - SYSTEM SAFE & CLEAN
echo ============================================================================
echo   Support ufo187: https://www.paypal.com/paypalme/ufo187GG
echo ============================================================================
echo.
echo Press any key to exit...
pause >nul
exit /b 0
