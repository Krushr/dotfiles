#!/bin/bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals

if [[ $# -lt 1 ]] || [[ ! -d $1 ]]; then
	echo "Usage:
	$0 <dir containg images>"
	exit 1
fi

# This controls (in seconds) when to switch to the next image
INTERVAL=1800

while true; do
	WALL=$(find "$1" -type f | shuf -n 1)
	feh --bg-fill "$WALL"
	sleep $INTERVAL
done
