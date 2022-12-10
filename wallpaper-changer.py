#!/usr/bin/env python3
# Change the desktop wallpaper based on the time of day

import os
from datetime import datetime

# Configuration
WALLPAPER_DIRECTORY = "/home/lucien/.local/share/backgrounds"
WALLPAPERS = [
    # Must be sorted by start time
    {"start": 6, "wallpaper": "Small Memory by Mikael Gustafsson.png"},
    {"start": 12, "wallpaper": "Scenery_2.png"},
    {"start": 17, "wallpaper": "The Valley by Louis Coyle.png"},
    {"start": 20, "wallpaper": "Slumber by Louis Coyle.png"},
]

# Determine current time of day
current_time = datetime.now().hour

# Determine which wallpaper to use
wallpaper = WALLPAPERS[-1]["wallpaper"] # Default to the last wallpaper if hour is smaller than all start times
for wallpaper_config in WALLPAPERS:
    if current_time >= wallpaper_config["start"]:
        wallpaper = wallpaper_config["wallpaper"]

# Set the desktop wallpaper
wallpaper_path = os.path.join(WALLPAPER_DIRECTORY, wallpaper)
print(f"Setting wallpaper to {wallpaper_path} because it is {current_time} o'clock")
os.system(f"dconf write /org/gnome/desktop/background/picture-uri-dark \"'file://{wallpaper_path}'\"")
