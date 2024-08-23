@echo off
setlocal enabledelayedexpansion

rem Set the source directory where your items are located
set "sourceDir=C:\Path\To\Your\Source\Directory"

rem Set the destination directory where you want to organize items
set "destinationDir=C:\Path\To\Your\Destination\Directory"

rem Ensure the destination directory exists
mkdir "%destinationDir%" 2>nul

rem Loop through the files in the source directory
for %%A in ("%sourceDir%\*.*") do (
    rem Extract the filename and extension
    set "file=%%~nA%%~xA"
    
    rem Remove any special characters that might cause issues
    set "file=!file:%%=!"
    
    rem Get the first letter of the filename (convert to uppercase)
    set "firstLetter=!file:~0,1!"
    set "firstLetter=!firstLetter:~0,1!"
    
    rem Create a subfolder with the first letter (if it doesn't exist)
    mkdir "%destinationDir%\!firstLetter!" 2>nul
    
    rem Move the file to the corresponding subfolder
    move "%%A" "%destinationDir%\!firstLetter!\" >nul
)

echo Organizing complete.
pause
