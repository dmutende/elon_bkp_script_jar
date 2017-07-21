@echo off

title Elon Backup Manager

echo Welcome to Elon Backup Manager
echo --------------------------------
echo.

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