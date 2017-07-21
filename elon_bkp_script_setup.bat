@echo off

title Elon Backup Manager

echo Welcome to Elon Backup Manager
echo --------------------------------
echo.

set user_res1=y
set /p user_res1=Would you like this program to run at startup? [y/n] (Default - y) 
echo.

IF "%user_res1%"=="y" (

	powershell "$s=(New-Object -COM WScript.Shell).CreateShortcut('elon_bkp_script_portable.lnk');$s.TargetPath='%~dp0elon_bkp_script_portable.bat';$s.WorkingDirectory='%CD%';$s.Save()"
move elon_bkp_script_portable.lnk "%userprofile%\Start Menu\Programs\Startup"

)

java -jar elon_bkp_script.jar

echo.
echo.
echo.

set "file=done.mp3"
( echo Set Sound = CreateObject("WMPlayer.OCX.7"^)
  echo Sound.URL = "%file%"
  echo Sound.Controls.play
  echo do while Sound.currentmedia.duration = 0
  echo wscript.sleep 100
  echo loop
  echo wscript.sleep (int(Sound.currentmedia.duration^)+1^)*1000) >sound.vbs
start /min sound.vbs

echo Press any key to exit... 
pause > nul
cls
exit