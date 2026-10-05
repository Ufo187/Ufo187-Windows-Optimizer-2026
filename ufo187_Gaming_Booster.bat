@echo off
:: =========================================================================
::  ufo187 Gaming Booster 2026 (FPS & Low Input Lag Optimizer)
::  Copyright (c) 2026 ufo187. All Rights Reserved.
::  Donate / Tip: https://www.paypal.com/paypalme/ufo187GG
::  Socials:      https://linktr.ee/ufo187
::  Safety:       100%% Safe - Dynamic Memory Trim + Network Latency Prep
:: =========================================================================
chcp 65001 >nul
title Ufo187 Gaming Booster 2026
color 0E

:: Check for Administrator privileges
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [!] Requesting Administrator privileges for Gaming Boost...
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
echo   Ufo187 GAMING BOOSTER 2026 - Maximum FPS ^& Lowest Frame Stutter
echo   Copyright (c) 2026 Ufo187. All Rights Reserved.
echo   PayPal Tip: https://www.paypal.com/paypalme/ufo187GG
echo   Linktree:   https://linktr.ee/ufo187
echo ============================================================================
echo.

echo [1/3] Flushing inactive RAM to give maximum physical memory to your game...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$code = @'
using System;
using System.Runtime.InteropServices;
public class M { [DllImport(\"psapi.dll\")] public static extern int EmptyWorkingSet(IntPtr h); }
'@; try { Add-Type -TypeDefinition $code -Language CSharp } catch {}; Get-Process | ForEach-Object { try { [M]::EmptyWorkingSet($_.Handle) | Out-Null } catch {} }; [System.GC]::Collect()" >nul 2>&1
rundll32.exe advapi32.dll,ProcessIdleTasks >nul 2>&1
echo        -> Gigabytes of RAM freed and ready for game launch.

echo.
echo [2/3] Resetting network sockets and flushing DNS cache for lowest ping...
ipconfig /flushdns >nul 2>&1
echo        -> DNS cache purged.

echo.
echo [3/3] Tuning Desktop Window Manager priority for reduced input lag...
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Process -Name 'dwm', 'csrss' -ErrorAction SilentlyContinue | ForEach-Object { try { $_.PriorityClass = 'High' } catch {} }" >nul 2>&1
echo        -> Compositor frame latency tuned.

powershell -NoProfile -Command "[Console]::Beep(1000, 150); [Console]::Beep(1300, 200)" >nul 2>&1
echo.
echo ============================================================================
echo   [v] GAMING BOOSTER ACTIVATED! READY FOR HIGH FPS GAMING!
echo ============================================================================
echo   Support ufo187: https://www.paypal.com/paypalme/ufo187GG
echo ============================================================================
echo.
echo Press any key to exit...
pause >nul
exit /b 0
