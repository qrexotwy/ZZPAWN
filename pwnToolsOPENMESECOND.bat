@echo off
setlocal EnableDelayedExpansion

:: Set the number of ZIP files you want to generate
set numFiles=5

:: Set the destination folder (Downloads)
set "destFolder=%USERPROFILE%\Downloads"

:: Characters to choose from
set "chars=ABCDEFGHIJKLMNOPQRSTUVWXYZ0123456789&#$"

:: Temporary folder to store all generated ZIP files
set "tempFolder=%destFolder%\temp"

:: Create the temporary folder for storing ZIP files
if not exist "%tempFolder%" mkdir "%tempFolder%"

:: Loop to create ZIP files
for /L %%i in (1,1,%numFiles%) do (
    set "filename={"
    :: Generate random file name of 10 characters
    for /L %%j in (1,1,10) do (
        set /A "rand=!random! %% 62"
        for /F "delims=" %%k in ('echo !rand!') do set "char=!chars:~%%k,1!"
        set "filename=!filename!!char!"
    )
    set "filename=!filename!}"
    
    :: Create an empty .mcpack file to zip
    echo. > "%tempFolder%\!filename!.mcpack"
    
    :: Create the ZIP file
    powershell -command "Compress-Archive -Path '%tempFolder%\!filename!.mcpack' -DestinationPath '%tempFolder%\!filename!.zip'"
    
    :: Remove the temporary .mcpack file after zipping
    del "%tempFolder%\!filename!.mcpack"
)

:: Create a final ZIP file that contains all the generated ZIP files
powershell -command "Compress-Archive -Path '%tempFolder%\*.zip' -DestinationPath '%destFolder%\ZZpwnTools.zip'"

:: Clean up the temporary folder
rd /s /q "%tempFolder%"

echo Successfully created %numFiles% pwn tools and placed them into ZZpwnTools.zip in your Downloads folder. Make sure to refresh the downloads folder
pause
