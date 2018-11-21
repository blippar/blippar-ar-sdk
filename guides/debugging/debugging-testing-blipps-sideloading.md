# Blippar SDK: Testing a Blipp Using Blipp Side-loading

Generally in order to test a blipp a new blipp version has to be uploaded to the hub. This is easy to do for blipps, that are developed using Blipp Builder. However for Blipp Builder script JS blipps updating them on hub takes time. Many blipp developers find it more convenient to test blipps by side-loading them to a local device before publishing the final blipp version on hub. It allows for quick iteration and testing instead of waiting for an upload to complete for every little change. The following manual describes how to side-load blipps for testing them with your custom app, that uses Blippar SDK.

## Side-loading for iOS SDK

### Prerequisites 

* iTunes: [http://www.apple.com/itunes/download/](http://www.apple.com/itunes/download/)
* iOS version of the device must be 10 or newer

### Steps

1. Add UIFileSharingEnabled property to project plist file.
2. Connect the iOS device via USB cable to the computer.
3. Open iTunes and select the device, navigate to File Sharing.
4. Select your custom app that uses Blippar SDK from the list.
5. Add (or drag and drop) files to your app Documents folder (empty by default). Add all assets and scripts to the Documents pane. Note: Files should be dumped in a flat file structure (no folders or subfolders, all files should be provided in a single heap).
6. To enable side-loading in the custom app using SDK during the SDK initialisation enter the following code: `sdk.debugSideloadEnabled = YES;`
7. The moment you do this the next valid trigger image (marker) you will scan will be used as a tracking image for the sideloaded blipp, and the blipp data will be pulled out from the sideload folder instead of the server.

    >Any marker won’t work, you’ll need to scan a marker for a blipp that’s available for your custom app to trigger

## Side-loading for Android Blippar SDK

### Prerequisites

* OSX/Linux based operating system or Windows (convert .sh files to .bat files and modify bash commands accordingly).
* Android Debug Bridge installed and on the PATH.

## Steps

1. You must have `adb` on your path. You can see this by appending to your `~/.bash_profile`, there are many guides online to tell you how to do it.
2. To manually upload blipp files for the custom app you can use `adb push` manually yourself to transfer over the the flattened blipp scripts and assets to the _blipparsdk/sideload_ directory in your app's bundle, creating the _sideload_ directory if it doesn't already exist.

    * On **OSX/Linux** you can use this [`deployToAndroid.sh`](../../scripts/deployToAndroid.sh) script to simplify this process.
    To call the script above: 
            ./deployToAndroid.sh <app_package>/blipparsdk/sideload "/<local path to blipp data>/"

    There is another script [`startDevAndroid.sh`](../../scripts/startDevAndroid.sh) which watches a blipp folder and automatically transfers the contents over to the device when it changes. This uses [`fswatch`](https://github.com/emcrisostomo/fswatch) which can be installed by doing:

            brew install fswatch

    To use the `startDevAndroid.sh` script call:
            ./startDev.sh ~/Downloads/blipps/surface-detection-demo 'com.blippar.ar.android'

    * On **Windows** you can use [`deployToAndroid.bat`](../../scripts/deployToAndroid.bat) and follow the instructions.

3. To verify that blipp files were copied successfully check the contents of your app package data folder:

        adb shell
        cd /sdcard/Android/data/<app_package>/blipparsdk
        ls

    You should see a sideload directory with your files from your machine flattened in it.

4. In your custom app change the property `sdk.setDebugSideloadingEnabled(true)`;
5. The moment you do this the next valid trigger image (marker) you will scan will be used as a tracking image for the sideloaded blipp, and the blipp data will be pulled out from the sideload folder instead of the server.

    >Any marker won’t work, you’ll need to scan a marker for a blipp that’s available for your custom app to trigger