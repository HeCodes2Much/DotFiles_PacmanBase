#!/usr/bin/env bash

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

BAR_NAME=main
MC=0

PRIMARY=$(xrandr --query | grep " connected" | grep "primary" | cut -d" " -f1)
OTHERS=$(xrandr --query | grep " connected" | grep -v "primary" | cut -d" " -f1)
DEFAULT_NETWORK_INTERFACE=$(ip route | grep '^default' | awk '{print $5}' | head -n1)

# Launch bar1 and bar2
if type "xrandr" > /dev/null; then
    TOP_BAR_CONFIG=$HOME/.config/polybar/monitor_$MC/config_top.ini
    BOTTOM_BAR_CONFIG=$HOME/.config/polybar/monitor_$MC/config_bottom.ini

    # Launch on primary monitor
    MONITOR=$PRIMARY polybar --reload -c "$TOP_BAR_CONFIG" $BAR_NAME &
    MONITOR=$PRIMARY polybar --reload -c "$BOTTOM_BAR_CONFIG" $BAR_NAME &

    # Launch on all other monitors

    for m in $OTHERS; do
        MC=$((MC+1))
        TOP_BAR_CONFIG=$HOME/.config/polybar/monitor_$MC/config_top.ini
        BOTTOM_BAR_CONFIG=$HOME/.config/polybar/monitor_$MC/config_bottom.ini

        DEFAULT_NETWORK_INTERFACE=$DEFAULT_NETWORK_INTERFACE MONITOR=$m polybar --reload -c "$TOP_BAR_CONFIG" $BAR_NAME &
        DEFAULT_NETWORK_INTERFACE=$DEFAULT_NETWORK_INTERFACE MONITOR=$m polybar --reload -c "$BOTTOM_BAR_CONFIG" $BAR_NAME &
    done
else
    polybar --reload main -c ~/.config/polybar/config_top.ini  &
    polybar --reload main -c ~/.config/polybar/config_bottom.ini  &
fi
