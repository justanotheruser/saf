@echo off
setlocal EnableDelayedExpansion

if -%1-==-- call :help & exit /b

set HAS_FLAGS=
set IS_MUTED=0
set VISUAL_NOTIF=0
call :parse_arguments %1
if %ERRORLEVEL% neq 0 exit /b
if "%2"=="" (
    if "%1"=="help" call :help & exit /b
)

call :get_command %*
call :run_command %COMMAND%
if "%HAS_FAILED%"=="1" exit /b
call :on_success
exit /b


:run_command
set HAS_FAILED=
(call %*) || (call :on_failure)
exit /b


:on_failure
set HAS_FAILED=1
if "%IS_MUTED%"=="0" (
    call play_sound.vbs "%~dp0on_finished__failure.mp3"
)
if "%VISUAL_NOTIF%"=="0" (
    REM TODO
)
exit /b


:on_success
if "%IS_MUTED%"=="0" (
    call play_sound.vbs "%~dp0on_finished__success.wav"
)
if "%VISUAL_NOTIF%"=="0" (
    REM TODO
)
exit /b


:parse_arguments
set first_arg=%1
if "%first_arg:~0,1%"=="-" (
    set HAS_FLAGS=1

    set pos=0
    :flag_processing
    if "%pos%" NEQ "" call :process_flag !first_arg:~%pos%,1!
    if %ERRORLEVEL% neq 0 exit /b 1
    set /a pos=pos+1
    if "!first_arg:~%pos%,1!" NEQ "" goto flag_processing
    exit /b
)
exit /b


:process_flag
if "%1"=="m" (goto flagM)
if "%1"=="v" (goto flagV)
echo Unexpected flag -%1
exit /b 1

:flagM
set IS_MUTED=1
goto endif

:flagV
set VISUAL_NOTIF=1
goto endif

:endif
exit /b


:get_command
set COMMAND=
set needs_skip=%HAS_FLAGS%
set args=
call :args_to_var %*
set COMMAND=%args%
exit /b


:args_to_var
if "%needs_skip%"=="1" (
    shift
    set needs_skip=0
)
if "%1"=="" exit /b
set args=%args% %1
shift
goto args_to_var


:help
echo SAF (slow as f**k) is utility to notify you when some other bash command has finished or requires your action.
echo Usage:
echo    saf ^<-flags^> possibly_slow_command --its arguments
exit /b