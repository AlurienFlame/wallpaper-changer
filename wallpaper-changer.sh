#!/bin/bash
# Changes the desktop wallpaper based on time of day. Designed to be run from cron.

# Files
WALLPAPER_DIRECTORY="/home/lucien/.local/share/backgrounds"
WALLPAPER_DAWN="Small Memory by Mikael Gustafsson.png"
WALLPAPER_DAY="Scenery_2.png"
WALLPAPER_DUSK="The Valley by Louis Coyle.png"
WALLPAPER_NIGHT="Slumber by Louis Coyle.png"

# Cutoff times
DAWN_START=6
DAY_START=12
DUSK_START=17
NIGHT_START=20

# Get the current hour of the day
HOUR=$(date +%H)

# Redirect stdout and stderr to logger
exec 1> >(logger -t wallpaper-changer) 2>&1

# Configure dbus (required for dconf to work from cron)
# Probably breaks if no session bus at that address
export DBUS_SESSION_BUS_ADDRESS="unix:path=/run/user/1000/bus"

# Set the wallpaper based on the time of day
if [ $HOUR -ge $DAWN_START -a $HOUR -lt $DAY_START ]; then
    echo "Setting wallpaper to '$WALLPAPER_DAWN' because it is $HOUR hours"
    plasma-apply-wallpaperimage "$WALLPAPER_DIRECTORY/$WALLPAPER_DAWN"
elif [ $HOUR -ge $DAY_START -a $HOUR -lt $DUSK_START ]; then
    echo "Setting wallpaper to '$WALLPAPER_DAY' because it is $HOUR hours"
    plasma-apply-wallpaperimage "$WALLPAPER_DIRECTORY/$WALLPAPER_DAY"
elif [ $HOUR -ge $DUSK_START -a $HOUR -lt $NIGHT_START ]; then
    echo "Setting wallpaper to '$WALLPAPER_DUSK' because it is $HOUR hours"
    plasma-apply-wallpaperimage "$WALLPAPER_DIRECTORY/$WALLPAPER_DUSK"
else
    echo "Setting wallpaper to '$WALLPAPER_NIGHT' because it is $HOUR hours"
    plasma-apply-wallpaperimage "$WALLPAPER_DIRECTORY/$WALLPAPER_NIGHT"
fi
