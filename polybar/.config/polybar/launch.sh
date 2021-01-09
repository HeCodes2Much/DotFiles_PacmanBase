#!/usr/bin/env sh

#------------------------------------------------------------------------------
# Path         - ~/.config/polybar/launch.sh
# GitHub       - https://github.com/The-Repo-Club/
# Author       - The-Repo-Club [wayne6324@gmail.com]
# Start On     - Sat 11 Dec 16:55:05 GMT 2021
# Modified On  - Sat 11 Dec 16:55:05 GMT 2021
#------------------------------------------------------------------------------

## Add this to your wm startup file.

# Terminate already running bar instances
killall -q polybar

# Wait until the processes have been shut down
while pgrep -u $UID -x polybar >/dev/null; do sleep 1; done

# Launch bar1 and bar2
if type "xrandr" > /dev/null; then
    while read F1 F2 _; do
        if [[ $F1 =~ ^[[:digit:]] ]]; then
            F2="${F2//+}"
            F2="${F2//\*}"
            MONITOR=$F2 polybar --reload main -c ~/.config/polybar/config_top.ini &
            MONITOR=$F2 polybar --reload main -c ~/.config/polybar/config_bottom.ini &
        fi
    done <<< $( xrandr --listactivemonitors )
else
    polybar --reload main -c ~/.config/polybar/config_top.ini  &
    polybar --reload main -c ~/.config/polybar/config_bottom.ini  &
fi
