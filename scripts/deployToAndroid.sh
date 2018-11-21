#!/bin/bash

# Description:	A little bash script to transfer files over to your android device on OSX for the purposes of sideloads
# 				Functions with BlippBasic and Javascript
#				Clears down the entire sideload directory when executed (note this includes any generated blipp data!)
#				Handles older blipp folder structure for assets
# Prerequisites: Needs adb installed on your machine
# Usage: 
# 		Called with two parameters
#		1) The name of the blippar package & directory to deploy to e.g. com.blippar.ar.android/sideload
#		2) The source directory for the blipp data
#		3) (optional) whether to clear down existing content or not first
# 
REMOVE_EXISTING_CONTENT=1
if [ "$#" -eq 3 ]; then
    REMOVE_EXISTING_CONTENT=$3
else
	if [ $# -ne 2 ]; then
		echo "Invalid number of arguments supplied ($#). Require 1) android package name & path 2) target top level directory"
		exit
	fi
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

if [ "$REMOVE_EXISTING_CONTENT" == 1 ]; then
	# Remove existing content from the device sideload folder
	echo "Removing existing sideload content"
	removeExistingContent $1
fi

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
		#echo "$BLIPP_DIRECTORY/assets/$f"
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

	#echo "$FIRST_DIRECTORY - FIRST_DIRECTORY"
	#echo "$FILE_COUNTER - FILE_COUNTER"
	#echo "$DIR_COUNTER - DIR_COUNTER"

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
