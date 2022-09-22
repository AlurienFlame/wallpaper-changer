#!/bin/bash
# Changes the desktop wallpaper based on time of day. Designed to be run from cron.

# Files
WALLPAPER_DIRECTORY="file:///home/lucien/.local/share/backgrounds"
WALLPAPER_DAWN="Small Memory by Mikael Gustafsson.png"
WALLPAPER_DAY="Scenery_2.png"
WALLPAPER_DUSK="The Valley by Louis Coyle.png"
WALLPAPER_NIGHT="Slumber by Louis Coyle.png"

# Cutoff times
DAWN_START=6
DAY_START=12
DUSK_START=17
NIGHT_START=22

# Configuration path
CONFIG_PATH="org.gnome.desktop.background picture-uri-dark"

# Get the current hour of the day
HOUR=$(date +%H)

# Log file
exec >>/home/lucien/dev/wallpaper-changer/wallpaper-changer.log

# Set the wallpaper based on the time of day
if [ $HOUR -ge $DAWN_START -a $HOUR -lt $DAY_START ]; then
  echo "$(date +"%Y/%m/%d %H:%M:%S") Setting wallpaper to '$WALLPAPER_DAWN' because it is $HOUR hours"
  gsettings set $CONFIG_PATH "$WALLPAPER_DIRECTORY/$WALLPAPER_DAWN"
elif [ $HOUR -ge $DAY_START -a $HOUR -lt $DUSK_START ]; then
  echo "$(date +"%Y/%m/%d %H:%M:%S") Setting wallpaper to '$WALLPAPER_DAY' because it is $HOUR hours"
  gsettings set $CONFIG_PATH "$WALLPAPER_DIRECTORY/$WALLPAPER_DAY"
elif [ $HOUR -ge $DUSK_START -a $HOUR -lt $NIGHT_START ]; then
  echo "$(date +"%Y/%m/%d %H:%M:%S") Setting wallpaper to '$WALLPAPER_DUSK' because it is $HOUR hours"
  gsettings set $CONFIG_PATH "$WALLPAPER_DIRECTORY/$WALLPAPER_DUSK"
else
  echo "$(date +"%Y/%m/%d %H:%M:%S") Setting wallpaper to '$WALLPAPER_NIGHT' because it is $HOUR hours"
  gsettings set $CONFIG_PATH "$WALLPAPER_DIRECTORY/$WALLPAPER_NIGHT"
fi
