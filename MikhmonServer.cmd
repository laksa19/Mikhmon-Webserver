:: Copyright 2020 Laksamadi Guko all rights reserved
@echo off
color 8F
mode CON:cols=55 lines=20
title Mikhmon Webserver
set defPORT=8088
set workdir=%~dp0php
set rootdir=%~dp0mikhmon
set title=Mikhmon Webserver
set c=by Laksamadi Guko

echo.
echo.
echo 	    MMNdhyssssssssssssssssssyhdNMM
echo 	    MhsssssssssssssssssssssssssshM
echo 	    hsssssssso++++++++++ossssssssh
echo 	    sssssso-`            `-sssssss
echo 	    ssssss`.ssssssssssssss`.yyssss
echo 	    ssssso `-:+----//--oss` yhysss
echo 	    ssssso `/s/  `+s-  oss` yhhhys
echo 	    ssssso .ss/  :ss-  oss` yhhhhh
echo 	    ssssso .ss/  :ss-  oss` yhhhhh
echo 	    ssssso .ss/  :ss-  oss` yhhhhh
echo 	    ssssss`.ss/  :ss-  oss`.hhhhhh
echo 	    sssssso.```  ```   ```-yhhhhhh
echo 	    hssssssssooooooooooosyhhhhhhhd
echo 	    MdysssssssyyhhhhhhhhhhhhhhhhmM
echo 	    MMNmhysssssssyhhhhhhhhhhddmMMM
echo.
echo 	    	    MIKHMON SERVER
echo 		  by Laksamadi Guko
echo.
timeout /t 2 >nul
goto check

:menu
echo.
echo  1-Stop Server
echo  0-Exit
echo.
:m
set /P M= Type 1 or 0 then press ENTER:
if not defined M GOTO m
if %M%==1 goto stop
if %M%==0 goto quit

:quit
echo  Exit
timeout /t 1 >nul
exit

:stop
taskkill /f /IM m-server.exe >nul
goto startX


:check
cls
tasklist /nh /fi "IMAGENAME eq m-server.exe" | find /i "m-server.exe" >nul && (
echo  %title% %c%
echo.
echo  Checking server...
timeout /t 1 >nul
goto startn
) || (
goto start
)

:dcheck
cls
tasklist /nh /fi "IMAGENAME eq m-server.exe" | find /i "m-server.exe" >nul && (
title %url%
echo  %title% %c%
echo.
echo  Checking server...
timeout /t 1 >nul
goto open
) || (
echo  %title% %c%
echo.
echo  Server not running
timeout /t 1 >nul
goto quit
)


:start
cls
echo %title% %c%
echo.
netstat -o -n -a | find "LISTENING" | find "0.0.0.0:8080" >nul && (
set port=%defPORT%
set url=%title% - http://127.0.0.1:%defPORT%
cd %workdir%
runbg m-server.exe -S 0.0.0.0:%defPORT% -t "%rootdir%"
goto dcheck
)  || (
set port=8080
set url=%title% - http://127.0.0.1:8080
cd %workdir%
runbg m-server.exe -S 0.0.0.0:8080 -t "%rootdir%"
goto dcheck
)

:startn
cls
echo %title% %c%
echo.
netstat -o -n -a | find "LISTENING" | find "0.0.0.0:8080" >nul && (
set port=8080
goto open
)  || (
set port=8088
goto open
)

:startX
cls
echo  %title% %c%
echo.
echo  Server not running
echo.
echo  1-Start Server
echo  0-Exit
echo.
:nn
set /P Mm= Type 1 or 0 then press ENTER:
if not defined Mm GOTO nn
if %Mm%==1 goto check
if %m%==0 goto quit

:open
cls
echo  %title% %c%
echo.
echo  Server is running 
echo  http://127.0.0.1:%port%
echo.
echo  Open in:
echo  1-Google Chrome
echo  2-Mozilla Firefox
echo  3-Microsoft Edge
echo.
echo  9-Stop Server
echo  0-Exit
echo.
:o
set /P Mo= Type 1, 2, 9 or 0 then press ENTER:
if not defined Mo GOTO o
if %Mo%==1 goto chrome
if %Mo%==2 goto firefox
if %Mo%==3 goto edge
if %Mo%==9 goto stop
if %Mo%==0 goto quit

:chrome
timeout /t 1 >nul
echo  Open Google Chrome
start chrome http://127.0.0.1:%port%
timeout /t 1 >nul
goto open


:firefox
timeout /t 1 >nul
echo  Open FireFox
start firefox http://127.0.0.1:%port%
timeout /t 1 >nul
goto open

:edge
timeout /t 1 >nul
echo  Open Microsoft Edge
start msedge http://127.0.0.1:%port% 
timeout /t 1 >nul
goto open
