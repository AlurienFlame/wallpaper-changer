# Wallpaper Changer

This script is designed to change the desktop wallpaper based on the time of day. It is intended to be run from cron.

## Usage

1. Clone the repository or download the `wallpaper-changer.sh` script.
2. Make sure the script is executable by running `chmod +x wallpaper-changer.sh`.
3. Edit the script to specify the locations of your wallpaper files and the desired cutoff times for each wallpaper.
4. Configure cron to run the script at the desired intervals.

## Configuration

The following variables can be configured in the script to customize the wallpaper changing behavior:

- `WALLPAPER_DIRECTORY` - The directory containing the wallpaper files.
- `WALLPAPER_DAWN` - The file name of the wallpaper to use during dawn.
- `WALLPAPER_DAY` - The file name of the wallpaper to use during the day.
- `WALLPAPER_DUSK` - The file name of the wallpaper to use during dusk.
- `WALLPAPER_NIGHT` - The file name of the wallpaper to use at night.
- `DAWN_START` - The hour of the day at which dawn begins (in 24 hour time).
- `DAY_START` - The hour of the day at which the day begins (in 24 hour time).
- `DUSK_START` - The hour of the day at which dusk begins (in 24 hour time).
- `NIGHT_START` - The hour of the day at which night begins (in 24 hour time).

## Running the Script

The script can be run manually by executing `./wallpaper-changer.sh` in a terminal.

To run the script automatically at regular intervals, it can be added to the crontab. Edit the crontab by running `crontab -e` and add a line like the following, replacing the path with the location of the `wallpaper-changer.sh` script on your system:

```bash
0 * * * * /path/to/wallpaper-changer.sh
```

This example will run the script every hour. Adjust the schedule to suit your needs.