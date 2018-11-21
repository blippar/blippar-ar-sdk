#!/bin/bash

REMOVE_EXISTING=1
if [ "$#" -eq 3 ]; then
    REMOVE_EXISTING=$3
else
    if [ "$#" -ne 2 ]; then
        echo "Illegal number of parameters 1) Path to local blipp content 2) Name of the target app 3) Whether the existing content should be removed or not
        echo "startDev.sh \"/Users/myuser/Documents/myblipp\" \"com.blippar.app\" "0"
        exit 1
    fi
fi

cleanup ()
{
    exit 0
}

command -v fswatch >/dev/null 2>&1 || { echo >&2 "Require fswatch to be installed but not found, run `brew install fswatch` to install"; exit 1; }

trap cleanup SIGINT SIGTERM

export PATH=$PATH:./

SCRIPT_DIR="$( cd "$( dirname "${BASH_SOURCE[0]}" )" && pwd )"
cd $SCRIPT_DIR
echo "Waiting for changes in $1"
while [ 1 ]; do 
    fswatch --latency=2.0 $1 | $SCRIPT_DIR/deployToAndroid.sh "$2/blipparsdk/sideload" "$1" $REMOVE_EXISTING
    echo "Copied '$1' to '$2'"
done
