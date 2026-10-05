@echo off
:: =========================================================================
::  ufo187 Optimizer Suite 2026 for Windows 10 & 11
::  Copyright (c) 2026 ufo187. All Rights Reserved.
::  Donate / Tip: https://www.paypal.com/paypalme/ufo187GG
::  Socials:      https://linktr.ee/ufo187
::  Safety:       100%% Safe - Official Microsoft Windows Win32 APIs
:: =========================================================================
chcp 65001 >nul
title Ufo187 Optimizer Suite 2026
color 0B

:: Check for Administrator privileges safely
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [i] Requesting Administrator permissions...
    echo Set UAC = CreateObject^("Shell.Application"^) > "%temp%\ufo187_getadmin.vbs"
    set "params=%*:"=""
    echo UAC.ShellExecute "cmd.exe", "/c """"%~s0"" %params%", "", "runas", 1 >> "%temp%\ufo187_getadmin.vbs"
    "%temp%\ufo187_getadmin.vbs"
    del /f /q "%temp%\ufo187_getadmin.vbs" >nul 2>&1
    exit /B
)
pushd "%CD%"
cd /d "%~dp0"

:MAIN_MENU
cls
echo ============================================================================
echo   ██╗   ██╗███████╗ ██████╗  ██╗ █████╗ ███████╗
echo   ██║   ██║██╔════╝██╔═══██╗███║██╔══██╗╚════██║
echo   ██║   ██║█████╗  ██║   ██║╚██║╚█████╔╝    ██╔╝
echo   ██║   ██║██╔══╝  ██║   ██║ ██║██╔══██╗   ██╔╝ 
echo   ╚██████╔╝██║     ╚██████╔╝ ██║╚█████╔╝   ██║  
echo    ╚═════╝ ╚═╝      ╚═════╝  ╚═╝ ╚════╝    ╚═╝  
echo ============================================================================
echo   Ufo187 OPTIMIZER SUITE 2026 - Windows 10 ^& 11 Edition
echo   Copyright (c) 2026 Ufo187. All Rights Reserved.
echo   PayPal Tip: https://www.paypal.com/paypalme/ufo187GG
echo   Linktree:   https://linktr.ee/ufo187
echo ============================================================================
echo.
powershell -NoProfile -ExecutionPolicy Bypass -Command "$os = Get-CimInstance Win32_OperatingSystem; $total = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2); $free = [math]::Round($os.FreePhysicalMemory / 1MB, 2); $used = [math]::Round($total - $free, 2); $pct = [math]::Round(($used / $total) * 100, 1); Write-Host ' [RAM STATUS]: ' -NoNewline; Write-Host ($used + ' GB used of ' + $total + ' GB (' + $pct + '%%)') -ForegroundColor Cyan"
echo.
echo  --------------------------------------------------------------------------
echo   [1] Quick RAM Purge (EmptyWorkingSet - 2 seconds)
echo   [2] PC Optimizer (Clean Temp Files + Dumps + Flush DNS)
echo   [3] Gaming Booster (RAM Purge + DNS Flush + Low Input Lag)
echo   [4] Restart Windows Explorer (Fixes laggy taskbar/icons)
echo   [5] Hardware & RAM Diagnostics
echo   [6] Support ufo187 (PayPal & Social Links)
echo   [0] Exit
echo  --------------------------------------------------------------------------
echo.
set /p choice="Select option [1-6, or 0 to exit]: "

if "%choice%"=="1" goto QUICK_PURGE
if "%choice%"=="2" goto PC_CLEAN
if "%choice%"=="3" goto GAMING_BOOST
if "%choice%"=="4" goto RESTART_EXPLORER
if "%choice%"=="5" goto DIAGNOSTICS
if "%choice%"=="6" goto SUPPORT
if "%choice%"=="0" exit /b 0

echo [!] Invalid option!
timeout /t 2 >nul
goto MAIN_MENU

:QUICK_PURGE
cls
echo [*] Purging Process Working Sets via native psapi.dll...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$code = @'
using System;
using System.Runtime.InteropServices;
public class Mem {
    [DllImport(\"psapi.dll\")]
    public static extern int EmptyWorkingSet(IntPtr h);
}
'@; try { Add-Type -TypeDefinition $code -Language CSharp } catch {}; Get-Process | ForEach-Object { try { [Mem]::EmptyWorkingSet($_.Handle) | Out-Null } catch {} }; [System.GC]::Collect()" >nul 2>&1
rundll32.exe advapi32.dll,ProcessIdleTasks >nul 2>&1
powershell -NoProfile -Command "[Console]::Beep(900, 150)" >nul 2>&1
echo.
echo [v] RAM memory successfully freed!
echo.
pause
goto MAIN_MENU

:PC_CLEAN
cls
echo [*] 1/3 Cleaning safe temporary cache files...
del /s /f /q "%temp%\*.*" >nul 2>&1
for /d %%p in ("%temp%\*.*") do rmdir "%%p" /s /q >nul 2>&1
del /s /f /q "%SystemRoot%\Temp\*.*" >nul 2>&1
for /d %%p in ("%SystemRoot%\Temp\*.*") do rmdir "%%p" /s /q >nul 2>&1

echo [*] 2/3 Cleaning old crash dumps and error reporting logs...
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportArchive\*.*" >nul 2>&1
del /f /s /q "%ProgramData%\Microsoft\Windows\WER\ReportQueue\*.*" >nul 2>&1
del /f /s /q "%LocalAppData%\CrashDumps\*.*" >nul 2>&1

echo [*] 3/3 Flushing DNS cache...
ipconfig /flushdns >nul 2>&1

powershell -NoProfile -Command "[Console]::Beep(880, 100); [Console]::Beep(1200, 200)" >nul 2>&1
echo.
echo [v] System cleanup complete!
echo.
pause
goto MAIN_MENU

:GAMING_BOOST
cls
echo [*] Purging RAM and preparing system for maximum FPS...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$code = @'
using System;
using System.Runtime.InteropServices;
public class Mem {
    [DllImport(\"psapi.dll\")]
    public static extern int EmptyWorkingSet(IntPtr h);
}
'@; try { Add-Type -TypeDefinition $code -Language CSharp } catch {}; Get-Process | ForEach-Object { try { [Mem]::EmptyWorkingSet($_.Handle) | Out-Null } catch {} }; [System.GC]::Collect()" >nul 2>&1
rundll32.exe advapi32.dll,ProcessIdleTasks >nul 2>&1
ipconfig /flushdns >nul 2>&1
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Process -Name 'dwm', 'csrss' -ErrorAction SilentlyContinue | ForEach-Object { try { $_.PriorityClass = 'High' } catch {} }" >nul 2>&1
echo.
echo [v] Gaming Booster active!
echo.
pause
goto MAIN_MENU

:RESTART_EXPLORER
cls
echo [*] Restarting Windows Explorer...
taskkill /f /im explorer.exe >nul 2>&1
timeout /t 1 /nobreak >nul 2>&1
start explorer.exe
echo [v] Windows Explorer restarted!
timeout /t 2 >nul
goto MAIN_MENU

:DIAGNOSTICS
cls
echo ============================================================================
echo   DIAGNOSTICS & SYSTEM INFO
echo ============================================================================
powershell -NoProfile -ExecutionPolicy Bypass -Command "$os = Get-CimInstance Win32_OperatingSystem; $cs = Get-CimInstance Win32_ComputerSystem; Write-Host ('System:     ' + $cs.Manufacturer + ' ' + $cs.Model); Write-Host ('OS Version: ' + $os.Caption + ' (' + $os.Version + ')'); $total = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2); $free = [math]::Round($os.FreePhysicalMemory / 1MB, 2); $used = [math]::Round($total - $free, 2); $pct = [math]::Round(($used / $total) * 100, 1); Write-Host ('Total RAM:  ' + $total + ' GB'); Write-Host ('Used RAM:   ' + $used + ' GB (' + $pct + '%%)'); Write-Host ('Free RAM:   ' + $free + ' GB')"
echo.
echo Top RAM-consuming processes:
echo ----------------------------------------------------------------------------
powershell -NoProfile -ExecutionPolicy Bypass -Command "Get-Process | Sort-Object -Property WorkingSet -Descending | Select-Object -First 5 Name, @{Name='RAM (MB)';Expression={[math]::Round($_.WorkingSet / 1MB, 1)}}, Id | Format-Table -AutoSize"
echo.
pause
goto MAIN_MENU

:SUPPORT
cls
echo ============================================================================
echo   SUPPORT ufo187 & SOCIALS
echo ============================================================================
echo   Creator:    ufo187
echo   Copyright:  (c) 2026 ufo187. All Rights Reserved.
echo.
echo   PayPal (Buy Me A Coffee / Tip):
echo   -> https://www.paypal.com/paypalme/ufo187GG
echo.
echo   Social Media & Links:
echo   -> https://linktr.ee/ufo187
echo.
echo   Opening links in your browser...
start https://linktr.ee/ufo187
start https://www.paypal.com/paypalme/ufo187GG
echo ============================================================================
echo.
pause
goto MAIN_MENU
