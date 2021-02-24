@echo off

:choices
cls
echo Replace G:\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe with your path .
echo Replace Administrator with the admin name or setup the admin account .
echo The computer name is %computername% .
echo The first time , the administrator has to fill the password , it will be saved with the /savecred option.
echo For the gta story , the administrator has to copy your folder ( Documents\Rockstar Games ) to its documents folder .
echo ------------------------------------------------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------------------------------------------------
echo If you see several icons ( Epic ) near the clock  .
echo Mouse over and the useless icons should disappear .
echo ------------------------------------------------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------------------------------------------------
echo 1 to close epic .
echo 2 to launch epic in normal mode .
echo 3 to launch epic in admin mode .
echo 4 to close this windows .
echo ------------------------------------------------------------------------------------------------------------------------------------
echo ------------------------------------------------------------------------------------------------------------------------------------
echo Make a choice
SET /P choice= 1 , 2 , 3 or 4 and press return :

if %choice% == 1 ( goto :epickill )
if %choice% == 2 ( goto :epic )
if %choice%c== 3 ( goto :epicadmin )
if %choice% == 4 ( goto :end )

:epickill
C:\Windows\System32\runas.exe /user:%computername%\Administrator /savecred  "taskkill /IM \"EpicGamesLauncher.exe\" /F"
goto :choices

:epic
C:\Windows\System32\runas.exe /user:%computername%\Administrator /savecred  "taskkill /IM \"EpicGamesLauncher.exe\" /F"
echo Wait 5 seconds 
timeout 5 > NUL
"G:\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe"
goto :choices

:epicadmin
C:\Windows\System32\runas.exe /user:%computername%\Administrator /savecred  "taskkill /IM \"EpicGamesLauncher.exe\" /F"
echo Wait 5 seconds 
timeout 5 > NUL
C:\Windows\System32\runas.exe /user:%computername%\Administrator /savecred "G:\Epic Games\Launcher\Portal\Binaries\Win32\EpicGamesLauncher.exe"
goto :choices

:end
