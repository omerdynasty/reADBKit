@echo off
title Adb Kit
color c
echo ========================================================================
echo DISCLAIMER:
echo The author of this script does not accept any responsibility for any 
echo consequences that may arise from the use of this script. No warranty 
echo is provided.
echo ========================================================================
echo Do you accept the disclaimer? (yes/no)
set /p accept=
if /I not "%accept%"=="yes" (
    echo You must accept the disclaimer to continue.
    exit /B
)
cls
color a
goto tc1
:tc1
echo Going back to main screen in 3 seconds...
timeout /T 3 /NOBREAK>nul
set /p= Press any key to continue
cls
echo ====================================================
echo Welcome to Adb Kit! Please select a class to continue.
echo ====================================================
echo [1] ADB Basic Operations
echo [2] Flash and Install Operations
echo [3] Device Management
echo [4] File Operations
echo [5] Advanced Operations
echo ====================================================
set /p tc1= Your choice = 
cls
if %tc1%==1 goto adb-basic
if %tc1%==2 goto flash-install
if %tc1%==3 goto device-management
if %tc1%==4 goto file-operations
if %tc1%==5 goto advanced-operations

:adb-basic
echo ====================================================
echo ADB Basic Operations
echo ====================================================
echo [1] Start ADB Server
echo [2] List Devices
echo [3] Install ADB
echo [4] Download ADB Zip
echo ====================================================
set /p tc2= Your choice = 
if %tc2%==1 goto server-start
if %tc2%==2 goto device-list
if %tc2%==3 goto adb-install
if %tc2%==4 goto adb-download
goto tc1

:flash-install
echo ====================================================
echo Flash and Install Operations
echo ====================================================
echo [1] Fastboot Flash
echo [2] Adb Sideload
echo [3] Install APK
echo ====================================================
set /p tc3= Your choice = 
if %tc3%==1 goto fastboot
if %tc3%==2 goto sideload
if %tc3%==3 goto apk
goto tc1

:device-management
echo ====================================================
echo Device Management
echo ====================================================
echo [1] Backup Device
echo [2] Restore Device
echo [3] View Device Info
echo ====================================================
set /p tc4= Your choice = 
if %tc4%==1 goto backup
if %tc4%==2 goto restore
if %tc4%==3 goto device-info
goto tc1

:file-operations
echo ====================================================
echo File Operations
echo ====================================================
echo [1] Push File to Device
echo [2] Pull File from Device
echo [3] View Logcat
echo ====================================================
set /p tc5= Your choice = 
if %tc5%==1 goto push
if %tc5%==2 goto pull
if %tc5%==3 goto logcat
goto tc1

:advanced-operations
echo ====================================================
echo Advanced Operations
echo ====================================================
echo [1] Kill ADB Server
echo [2] Enable Wireless Debugging
echo [3] Install Multiple APKs
echo ====================================================
set /p tc6= Your choice = 
if %tc6%==1 goto kill-server
if %tc6%==2 goto wifi-debug
if %tc6%==3 goto install-multiple-apks
goto tc1

:: ADB Basic Operations
:adb-download
echo Downloading ADB Zip Package...
wget https://dl.google.com/android/repository/platform-tools_r34.0.3-windows.zip
echo Adb Zip Package Downloaded!
goto tc1

:server-start
echo Starting ADB Server...
adb start-server
echo Adb Server Started!
goto tc1

:device-list
echo Listing Devices...
adb devices > devices.txt
start notepad devices.txt
echo Device List Retrieved!
goto tc1

:adb-install
echo Starting ADB Installation...
setup-adb
echo Adb Installation Completed!
goto tc1

:: Flash and Install Operations
:fastboot
echo Warning! Flashing operations can be dangerous.
echo Your device may reject unsigned packages.
echo If something goes wrong, the device may be damaged.
echo I do not accept responsibility.
set /p= I accept...
cls
echo Please specify the type of the flash file. (e.g., recovery)
set /p img-type=
cls
echo Now, place the img file into the kit and type its name completely (include the .img extension)
set /p img-name=
cls
echo Flashing operation is being performed...
echo ============================================
fastboot flash %img-type% %img-name%
echo ============================================
set /p= Press any key to continue...
goto tc1

:sideload
echo Warning! It is advised not to use unsigned packages in sideload.
echo I do not accept responsibility.
set /p= I accept...
cls
echo Type the full name of the zip file to sideload (.zip extension)
set /p sd-zip=
cls
echo Starting sideload...
echo ============================================
fastboot sideload %sd-zip%
echo ============================================
set /p= Press any key to continue...
goto tc1

:apk
echo Warning! If you are using root, only install APKs from trusted sources.
echo Even without root, malicious APKs may exist.
echo I do not accept responsibility.
set /p= I accept...
cls
echo Type the name of the APK file
set /p apk-name=
cls
adb install %apk-name%
echo APK successfully installed.
set /p= Press any key to continue...
goto tc1

:: Device Management
:backup
echo Backing up device...
adb backup -apk -shared -all -f backup.ab
echo Backup completed.
goto tc1

:restore
echo Restoring from backup...
adb restore backup.ab
echo Restore completed.
goto tc1

:device-info
echo Retrieving device info...
adb shell getprop
goto tc1

:: File Operations
:push
echo Pushing file to device...
set /p local-file= Enter the local file path:
set /p device-path= Enter the device path:
adb push %local-file% %device-path%
echo File pushed successfully.
goto tc1

:pull
echo Pulling file from device...
set /p device-path= Enter the device file path:
set /p local-dir= Enter the local directory path:
adb pull %device-path% %local-dir%
echo File pulled successfully.
goto tc1

:logcat
echo Retrieving logcat...
adb logcat
goto tc1

:: Advanced Operations
:kill-server
echo Killing ADB server...
adb kill-server
echo ADB server killed successfully.
goto tc1

:wifi-debug
echo Enabling wireless debugging...
echo Enter the device's IP address:
set /p ip-address=
adb tcpip 5555
adb connect %ip-address%
echo Device connected wirelessly.
goto tc1

:install-multiple-apks
echo Installing multiple APKs...
echo Enter the folder path containing APKs:
set /p apk-folder=
for %%f in (%apk-folder%\*.apk) do adb install %%f
echo All APKs installed successfully.
goto tc1
