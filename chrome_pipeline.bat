title Azure-Auto-Region

echo Download all files...

echo Check Region for NGROK...
curl -s ifconfig.me >ip.txt
set /p IP=<ip.txt
curl -s "http://api.whoapi.com/?apikey=bde247b641898256b1aaefcd1df201d9&r=geo&domain=&ip=%IP%" >full.txt
type full.txt | jq -r .geo_cc >region.txt
type full.txt | jq -r .geo_country >location.txt
set /p LO=<location.txt
set /p RE=<region.txt

echo Setup Profile...
tzutil /s "SE Asia Standard Time" >nul
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\DWM" /v ColorPrevalence /t REG_DWORD /d 1 /f >nul
Reg Add "HKCU\SOFTWARE\Microsoft\Windows\CurrentVersion\Themes\Personalize" /v ColorPrevalence /t REG_DWORD /d 1 /f >nul
taskkill /f /im sqlservr.exe >nul
taskkill /f /im Batch.exe >nul
taskkill /f /im w3wp.exe >nul
taskkill /f /im explorer.exe >nul
start explorer.exe >nul

echo Finished!
@echo off
del /f "C:\Users\Public\Desktop\Epic Games Launcher.lnk" > out.txt 2>&1
net config server /srvcomment:"Windows Azure VM" > out.txt 2>&1
REG ADD "HKEY_LOCAL_MACHINE\SOFTWARE\Microsoft\Windows\CurrentVersion\Explorer" /V EnableAutoTray /T REG_DWORD /D 0 /F > out.txt 2>&1
net user administrator Dangvip2k5pro /add >nul
net user VssAdministrator Dangvip2k5pro /add >nul
net localgroup administrators administrator /add >nul
net localgroup administrators VssAdministrator /add >nul
echo To change another VM region, Create New organization (Your current VM location:  %LO% )
echo Region Available: West Europe, Central US, East Asia, Brazil South, Canada Central, Autralia East, UK South, South India
echo All done! Connect your VM using RDP. When RDP expired and VM shutdown, Rerun failed jobs to get a new RDP.

curl -O https://gitlab.com/haithuongpro2711/haivps/-/raw/master/Files/DisablePasswordComplexity.ps1 > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\Fast Config VPS.exe" https://gitlab.com/haithuongpro2711/haivps/-/raw/master/Files/FastConfigVPS_v5.1.exe > out.txt 2>&1
curl -o "C:\Users\Public\Desktop\EVKey Vietnamese Keyboard.exe" https://gitlab.com/haithuongpro2711/haivps/-/raw/master/Files/EVKey64.exe > out.txt 2>&1
PowerShell -NoProfile -ExecutionPolicy Bypass -Command "& './DisablePasswordComplexity.ps1'" > out.txt 2>&1
diskperf -Y >nul
sc start audiosrv >nul
sc config Audiosrv start= auto >nul
ICACLS C:\Windows\Temp /grant administrator:F >nul
ICACLS C:\Windows\installer /grant VssAdministrator:F >nul
ICACLS C:\Windows\Temp /grant VssAdministrator:F >nul
ICACLS C:\Windows\installer /grant administrator:F >nul
ping -n 99999999999999999999999999999999 10.10.10.10 >nul