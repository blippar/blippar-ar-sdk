@echo off
cls
setlocal EnableDelayedExpansion
echo ....................................................................
echo Welcome to Blippar android sideload! Please enter your package name.
echo ....................................................................
echo.
echo Checking for previous used package name..
echo.
if exist blipparPackageSaveFile.txt (
    set /p appPackageName=<blipparPackageSaveFile.txt
    echo Previous package name detected !appPackageName!
    echo.
    goto packageChoice
) else (
    echo =================================
    echo No previous package name detected
    echo =================================
    echo.
    goto enterPackageName
)
:main
echo.
echo Your package name is set to : !appPackageName!
echo.
echo Checking to see if sideload folder exits....
echo.
adb shell "if [ -d /sdcard/Android/data/!appPackageName!/blipparsdk/sideload/ ]; then echo 1; else echo 0; fi" > cmd.txt
set /p CMD=<cmd.txt
DEL cmd.txt
IF %CMD% EQU 1  (
    echo =============
    echo Folder exists
    echo =============
    echo.
    goto choice
 ) ELSE ( 
    echo =====================
    echo Folder does not exist
    echo =====================
    echo.
    echo Creating Sideload directory ...
    adb shell mkdir /sdcard/Android/data/!appPackageName!/blipparsdk/sideload
    goto copyBlipp
 )
:packageChoice
echo Do you want to use previous package name[Y/N]?
set /p INPUT=Type input: %=%
if /I "%INPUT%" == "Y" goto :usePackageName
if /I "%INPUT%" == "y" goto :usePackageName
if /I "%INPUT%" == "N" goto :enterPackageName
if /I "%INPUT%" == "n" goto :enterPackageName
echo Incorrect input & goto packageChoice 
:choice
echo Do you want to clear the contents of the sideload folder[Y/N]?
set /p INPUT=Type input: %=%
if /I "%INPUT%" == "Y" goto :clearSideload
if /I "%INPUT%" == "y" goto :clearSideload
if /I "%INPUT%" == "N" goto :copyBlipp
if /I "%INPUT%" == "n" goto :copyBlipp
echo Incorrect input & goto choice 
:clearSideload
echo.
echo Clearing sideload ...
echo.
echo ====
echo Done
echo ====
adb shell rm -rf /sdcard/Android/data/!appPackageName!/blipparsdk/sideload/*
:copyBlipp
echo.
echo Copying Blipp files across ...
echo.
echo adb push %1/javascript/. /sdcard/Android/data/!appPackageName!/blipparsdk/sideload/
adb push %1/javascript/. /sdcard/Android/data/!appPackageName!/blipparsdk/sideload/
echo adb push %1/assets/. /sdcard/Android/data/!appPackageName!/blipparsdk/sideload/
adb push %1/assets/. /sdcard/Android/data/!appPackageName!/blipparsdk/sideload/
echo.
echo ============================
echo Sucess all files transfered!
echo ============================
@pause
exit
:usePackageName
goto main
:enterPackageName
set /p appPackageName=[Enter Package Name for example com.blippar.example]
echo !appPackageName!>blipparPackageSaveFile.txt
goto main
@pause

