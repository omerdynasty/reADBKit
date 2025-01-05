# ReADBKit - Your ADB & Fastboot Companion 🚀

ReADBKit is a comprehensive, easy-to-use toolkit designed for Android enthusiasts and developers. With its intuitive menu system, ReADBKit streamlines common ADB and Fastboot operations, enabling you to:

- Manage devices efficiently.
- Flash and sideload with confidence.
- Push and pull files effortlessly.
- Perform advanced operations with ease.

Whether you're a beginner exploring the world of Android or a seasoned developer, ReADBKit is your go-to solution for managing Android devices via ADB and Fastboot. It's optimized, feature-packed, and designed with user-friendliness in mind. 🎉

---

### 📌 I have nothing to hide, everything is open source. Feel free to fix problems, but I'd be happy if you give attribution.

---

### **1. Introduction & Disclaimer:**
```batch
@echo off
title Adb Kit
color c
```
- `@echo off` hides the command being executed in the console for cleaner output.
- `title Adb Kit` sets the window title to "Adb Kit."
- `color c` changes the text color in the terminal to red (color code `c`).

```batch
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
```
- This block displays a disclaimer to the user and asks if they accept it.
- If the user does not type "yes" (case-insensitive), the script exits (`exit /B`).

```batch
cls
color a
goto tc1
```
- Clears the screen (`cls`), changes the text color to green (`color a`), and moves to the next part of the script (`goto tc1`).

### **2. Main Menu (tc1):**
```batch
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
```
- Displays a main menu and waits for the user to select an option.
- The script checks the user’s choice (`set /p tc1= Your choice =`) and redirects them to the corresponding section based on the input.

### **3. Submenus (Operations):**

#### **ADB Basic Operations (adb-basic):**
```batch
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
```
- Displays a submenu for basic ADB operations, where the user can choose to:
  - Start the ADB server.
  - List connected devices.
  - Install ADB.
  - Download the ADB zip file.

#### **Flash and Install Operations (flash-install):**
```batch
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
```
- A submenu for operations related to flashing and installing, including:
  - Fastboot flash.
  - Adb sideload.
  - Installing APKs.

#### **Device Management (device-management):**
```batch
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
```
- A submenu for managing devices:
  - Backup a device.
  - Restore a device from backup.
  - View device information.

#### **File Operations (file-operations):**
```batch
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
```
- A submenu for file operations:
  - Push files to the device.
  - Pull files from the device.
  - View logcat output.

#### **Advanced Operations (advanced-operations):**
```batch
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
```
- A submenu for advanced operations:
  - Kill the ADB server.
  - Enable wireless debugging.
  - Install multiple APKs.

### **4. Specific Operations:**

#### **ADB Basic Operations:**
- **Download ADB Zip**:
  ```batch
  :adb-download
  echo Downloading ADB Zip Package...
  wget https://dl.google.com/android/repository/platform-tools_r34.0.3-windows.zip
  echo Adb Zip Package Downloaded!
  goto tc1
  ```
  Downloads the ADB tools zip package.

- **Start ADB Server**:
  ```batch
  :server-start
  echo Starting ADB Server...
  adb start-server
  echo Adb Server Started!
  goto tc1
  ```
  Starts the ADB server.

- **List Devices**:
  ```batch
  :device-list
  echo Listing Devices...
  adb devices > devices.txt
  start notepad devices.txt
  echo Device List Retrieved!
  goto tc1
  ```
  Lists connected devices and opens the device list in Notepad.

- **Install ADB**:
  ```batch
  :adb-install
  echo Starting ADB Installation...
  setup-adb
  echo Adb Installation Completed!
  goto tc1
  ```
  Installs ADB using the setup script.

#### **Flash and Install Operations:**
- **Fastboot Flash**:
  ```batch
  :fastboot
  echo Warning! Flashing operations can be dangerous...
  fastboot flash %img-type% %img-name%
  echo Flashing operation completed.
  goto tc1
  ```
  Performs a fastboot flash operation, requiring the user to specify the image file type and name.

- **ADB Sideload**:
  ```batch
  :sideload
  fastboot sideload %sd-zip%
  echo Sideloading completed.
  goto tc1
  ```
  Uses ADB sideload to install a ZIP file.

- **Install APK**:
  ```batch
  :apk
  adb install %apk-name%
  echo APK installed.
  goto tc1
  ```
  Installs an APK file on the device.

#### **Device Management:**
- **Backup Device**:
  ```batch
  :backup
  adb backup -apk -shared -all -f backup.ab
  echo Backup completed.
  goto tc1
  ```
  Backs up the device data.

- **Restore Device**:
  ```batch
  :restore
  adb restore backup.ab
  echo Restore completed.
  goto tc1
  ```
  Restores the device from a backup.

- **Device Info**:
  ```batch
  :device-info
  adb shell getprop
  goto tc1
  ```
  Retrieves device properties.

#### **File Operations:**
- **Push File to Device**:
  ```batch
  :push
  adb push %local-file% %device-path%
  echo File pushed successfully.
  goto tc1
  ```
  Pushes a local file to the device.

- **Pull File from Device**:
  ```batch
  :pull
  adb pull %device-path% %local-dir%
  echo File pulled successfully.
  goto tc1
  ```
  Pulls a file from the device to the local machine.

- **Logcat**:
  ```batch
  :logcat
  adb logcat
  goto tc1
  ```
  Displays logcat output from the device.

#### **Advanced Operations:**
- **Kill ADB Server**:
  ```batch
  :kill-server
  adb kill-server
  echo ADB server killed.
  goto tc1
  ```
  Stops the ADB server.

- **Enable Wireless Debugging**:
  ```batch
  :wifi-debug
  adb tcpip 5555
  adb connect %ip-address%
  echo Device connected wirelessly.
  goto tc1
  ```
  Enables wireless debugging and connects to the device via Wi-Fi.

- **Install Multiple APKs**:
  ```batch
  :install-multiple-apks
  for %%f in (%apk-folder%\*.apk) do adb install %%f
  echo All APKs installed.
  goto tc1
  ```
  Installs all APKs from a specified folder.

### **5. End of Script:**
- Each operation returns to the main menu (`goto tc1`), allowing the user to select another action.

---

This script essentially provides a simple command-line interface for interacting with ADB and Fastboot, enabling users to perform various operations like installing ADB, flashing images, managing devices, transferring files, and more.
