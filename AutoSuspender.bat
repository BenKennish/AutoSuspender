@echo off
setlocal 

rem A wrapper around the PowerShell script because, by default, Windows will
rem refuse to execute PowerShell scripts directly

if "%~1"=="/inline" (
    echo Running AutoSuspender in this terminal...
    rem Run the powershell script and pass all arguments
    rem (except the "/inline")
    rem
    rem if we use this mode it allows us to see final output that the script
    rem might produce, e.g. error msg, however, use of ctrl-C can cause an annoying
    rem "Terminate batch job (Y/N)?" prompt
    powershell -ExecutionPolicy Bypass -File "%~dp0\AutoSuspender.ps1" %2 %3 %4 %5 %6 %7 %8 %9
) else (
    rem run the powershell script (in a separate window), passing all arguments
    echo Running AutoSuspender in external window ^(use /inline to run inline^)...
    start "" powershell -ExecutionPolicy Bypass -File "%~dp0\AutoSuspender.ps1" %*
)

exit /b