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

1. To manually upload blipp files for the custom app you can use `adb push` manually yourself to transfer over the the flattened blipp scripts and assets to the _blipparsdk/sideload_ directory in your app's bundle, creating the _sideload_ directory if it doesn't already exist. 

    Alternatively you can use following script to simplify this process (OSX/Linux bash):

        #!/bin/bash
        
        # Description:  A little bash script to transfer files over to your android device on OSX for the purposes of sideloads
        # Clears down the entire sideload directory when executed (note this includes any generated blipp data!)
        # Handles older blipp folder structure for assets
        # Prerequisites: Needs adb installed and on your path on your machine
        # Usage:
        #       Called with two parameters
        #       1) The name of the blippar package & directory to deploy to e.g. com.blippar.ar.android/sideload
        #       2) The source directory for the blipp data
        #
        
        if [ $# -ne 2 ]
        then
            echo "Invalid number of arguments supplied ($#). Require 1) android package name & path 2) target top level directory"
            exit
        fi
        
        function removeExistingContent()
        {  
            if [ -z "$1" ]                           # Is parameter #1 zero length?
            then
                echo "Expected directory name for sideload path"  # Or no parameter passed.
                return
            fi
        
            SIDELOAD_DIRECTORY=${1-$DEFAULT}
            adb shell "
            if [ -d \"/sdcard/Android/data/$SIDELOAD_DIRECTORY\" ]; then
                cd \"/sdcard/Android/data/$SIDELOAD_DIRECTORY\"
                rm -rf *
            else
                echo \"Unable to delete contents at /sdcard/Android/data/$SIDELOAD_DIRECTORY, directory doesn't exist\"
            fi
            exit"
        }
        
        CWD="$PWD"
        
        if [ ! -d "$2" ]; then
            echo "Target top level directory does not exist: $2"
            exit
        fi
        
        # Remove existing content from the device sideload folder
        echo "Removing existing sideload content"
        removeExistingContent $1
        
        BLIPP_DIRECTORY=$2
        FOUND_ASSETS_OR_JS=0
        if [ -d "$BLIPP_DIRECTORY/assets" ]; then
            echo "Copying: $BLIPP_DIRECTORY/assets"
            cd "$BLIPP_DIRECTORY/assets"
            FOUND_ASSETS_OR_JS=1
            DIR_COUNTER=0
            FIRST_DIRECTORY=
            FILE_COUNTER=0
            for f in *; do
                if [ -d "$BLIPP_DIRECTORY/assets/$f/" ]; then
                    let DIR_COUNTER=DIR_COUNTER+1
                    if [ ${#FIRST_DIRECTORY} == 0 ]; then
                        FIRST_DIRECTORY="$f"
                    fi
                elif [ -f "$BLIPP_DIRECTORY/assets/$f" ]; then
                    let FILE_COUNTER=FILE_COUNTER+1
                else
                    echo "Unknown type of path"        
                fi
            done
        
            # If we have no files and just a single directory then copy over the entire directory
            # Otherwise we just take assets as the root
            if [ "$DIR_COUNTER" == "1" ] && [ "$FILE_COUNTER" == "0" ]
            then
                # old style has a single directory in the assets folder
                adb push "$BLIPP_DIRECTORY/assets/$FIRST_DIRECTORY/." "/sdcard/Android/data/$1"
            else
                # old style has a single directory in the assets folder
                adb push "$BLIPP_DIRECTORY/assets/." "/sdcard/Android/data/$1"
            fi
            cd "$CWD"
        fi
        
        if [ -d "$BLIPP_DIRECTORY/javascript" ]; then
            echo "Copying: $BLIPP_DIRECTORY/javascript"
            adb push "$BLIPP_DIRECTORY/javascript/." "/sdcard/Android/data/$1"
            FOUND_ASSETS_OR_JS=1
        fi
        
        if [ -d "$BLIPP_DIRECTORY/xml" ]; then
            echo "Copying: $BLIPP_DIRECTORY/javascript"
            adb push "$BLIPP_DIRECTORY/xml/." "/sdcard/Android/data/$1"
            FOUND_ASSETS_OR_JS=1
        fi
        
        if [ $FOUND_ASSETS_OR_JS == 0 ]; then
            adb push "$BLIPP_DIRECTORY/." "/sdcard/Android/data/$1"
        fi
    
    To call the script above: `./deployToAndroid.sh <app_package>/blipparsdk/sideload "/<local path to blipp data>/"`

2. To verify that blipp files were copied successfully check the contents of your app package data folder:

        adb shell
        cd /sdcard/Android/data/<app_package>/blipparsdk
        ls

    You should see a sideload directory with your files from your machine flattened in it.

3. In your custom app change the property `sdk.setDebugSideloadingEnabled(true)`;
4. The moment you do this the next valid trigger image (marker) you will scan will be used as a tracking image for the sideloaded blipp, and the blipp data will be pulled out from the sideload folder instead of the server.

    >Any marker won’t work, you’ll need to scan a marker for a blipp that’s available for your custom app to trigger