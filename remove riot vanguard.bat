:: Based on https://support-valorant.riotgames.com/hc/en-us/articles/360044648213-Uninstalling-Riot-Vanguard
:: Uninstalling Riot Vanguard with a BATCHFILE

@echo off
goto check_permissions
:check_permissions
    echo Administrative Permissions required to run. Detecting...
    
    net session >nul 2>&1
    if %errorLevel% == 0 (
        echo Success: Administrative permissions confirmed.
        timeout /t 2
        echo.
        echo.
        echo Deleting Riot Vanguard...
        sc delete vgc
        echo.
        echo deleted vgc
        sc delete vgk
        echo.
        echo deleted vgk
        echo.
        echo.
        echo Restart required. Open part 2 to proceed with uninstallation.
        pause
        shutdown /r
    ) else (
        echo Failure: Current permissions inadequate.
    )

    pause >nul