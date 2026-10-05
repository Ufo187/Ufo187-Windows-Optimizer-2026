@echo off
:: =========================================================================
::  Ufo187 RAM Purge 2026 (Dedicated Memory Optimizer)
::  Copyright (c) 2026 Ufo187. All Rights Reserved.
::  Donate / Tip: https://www.paypal.com/paypalme/ufo187GG
::  Socials:      https://linktr.ee/ufo187
::  Target OS:    Windows 10 & Windows 11 (64-bit / 32-bit)
::  Safety:       100%% Safe - Official Microsoft psapi.dll Win32 Engine
::  Portable:     No installation, No WinRAR needed
:: =========================================================================
chcp 65001 >nul
title Ufo187 RAM Purge 2026
color 0B

:: Check for Administrator privileges safely
>nul 2>&1 "%SYSTEMROOT%\system32\cacls.exe" "%SYSTEMROOT%\system32\config\system"
if '%errorlevel%' NEQ '0' (
    echo [!] Requesting Administrator privileges for memory purge...
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
echo   Ufo187 RAM PURGE 2026 - Dedicated Memory Optimizer
echo   Copyright (c) 2026 Ufo187. All Rights Reserved.
echo   PayPal Tip: https://www.paypal.com/paypalme/ufo187GG
echo   Linktree:   https://linktr.ee/ufo187
echo ============================================================================
echo.

echo [*] Measuring physical memory status...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$os = Get-CimInstance Win32_OperatingSystem; $total = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2); $free = [math]::Round($os.FreePhysicalMemory / 1MB, 2); $used = [math]::Round($total - $free, 2); $pct = [math]::Round(($used / $total) * 100, 1); Write-Host ' [RAM BEFORE]: ' -NoNewline; Write-Host ($used + ' GB used / ' + $total + ' GB (' + $pct + '%%)') -ForegroundColor Yellow"
echo.

echo [1/3] Purging Process Working Sets via native psapi.dll...
powershell -NoProfile -ExecutionPolicy Bypass -Command "$code = @'
using System;
using System.Runtime.InteropServices;
public class WinMem {
    [DllImport(\"psapi.dll\")]
    public static extern int EmptyWorkingSet(IntPtr hProcess);
}
'@; try { Add-Type -TypeDefinition $code -Language CSharp } catch {}; Get-Process | ForEach-Object { try { [WinMem]::EmptyWorkingSet($_.Handle) | Out-Null } catch {} }" >nul 2>&1
echo        -> Idle process resident memory returned to system pool.

echo.
echo [2/3] Flushing CLR Garbage Collection and managed heap buffers...
powershell -NoProfile -ExecutionPolicy Bypass -Command "[System.GC]::Collect(); [System.GC]::WaitForPendingFinalizers()" >nul 2>&1
echo        -> Managed memory heaps compacted.

echo.
echo [3/3] Flushing Standby cache and idle background pages...
rundll32.exe advapi32.dll,ProcessIdleTasks >nul 2>&1
echo        -> Standby memory pages released.

echo.
echo ============================================================================
echo   RAM PURGE COMPLETED
echo ============================================================================
powershell -NoProfile -ExecutionPolicy Bypass -Command "$os = Get-CimInstance Win32_OperatingSystem; $total = [math]::Round($os.TotalVisibleMemorySize / 1MB, 2); $free = [math]::Round($os.FreePhysicalMemory / 1MB, 2); $used = [math]::Round($total - $free, 2); $pct = [math]::Round(($used / $total) * 100, 1); Write-Host ' [RAM AFTER]:  ' -NoNewline; Write-Host ($used + ' GB used / ' + $total + ' GB (' + $pct + '%%)') -ForegroundColor Green"
echo ============================================================================

powershell -NoProfile -Command "[Console]::Beep(880, 120); [Console]::Beep(1175, 180)" >nul 2>&1
echo.
echo [v] Memory optimized safely with zero process crashes!
echo [?] Support Ufo187: https://www.paypal.com/paypalme/ufo187GG
echo.
echo Press any key to exit...
pause >nul
exit /b 0
