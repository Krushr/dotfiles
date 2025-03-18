#!/bin/bash

# This script will randomly go through the files of a directory, setting it
# up as the wallpaper at regular intervals

if [[ $# -lt 1 ]] || [[ ! -d $1 ]]; then
  echo "Usage:
	$0 <dir containg images>"
  exit 1
fi

CACHE_DIR=~/.cache/random-wall

# This controls (in seconds) when to switch to the next image
INTERVAL=1800

wal -R

while true; do
  WALL=$(find $1 -type f | shuf -n 1)
  hyprctl hyprpaper preload $WALL
  hyprctl hyprpaper wallpaper DP-2,$WALL
  hyprctl hyprpaper wallpaper HDMI-A-1,$WALL
  hyprctl hyprpaper unload unused
  wal -nq -i $WALL
  ln -s -f $WALL $CACHE_DIR/current
  gm convert $WALL -blur 50x30 $CACHE_DIR/blurred
  sleep $INTERVAL
done
