#!/usr/bin/env bash

# path:       ~/.config/repowm/autostart.sh
# author:     The-Repo-Club [wayne6324@gmail.com]
# github:     https://github.com/The-Repo-Club/instawm
# date:       2021-04-10 12:34:47.440579
#

if ! command -v xautolock &> /dev/null; then
    echo "xautolock could not be found"
    exit
else
    if ! pgrep -x "xautolock" > /dev/null; then
        xautolock -time 10 -locker 'multimonitorlock -l -- --time-str="%H:%M"' -notify 30 -notifier "notify-send -u critical -- 'LOCKING screen in 30 seconds'" &
    else
        echo "xautolock already Running"
    fi
fi

if ! command -v picom &> /dev/null; then
    echo "picom could not be found"
    exit
else
    if ! pgrep -x "picom" > /dev/null; then
        picom --config $HOME/.config/repowm/picom.conf &
    else
        echo "picom already Running"
    fi
fi

if ! command -v feh &> /dev/null; then
    echo "feh could not be found"
    exit
else
    if ! test -f "$HOME/.fehbg"; then
        echo "$HOME/.fehbg could not be found"
        exit
    else
        sh $HOME/.fehbg
    fi
fi

if command -v /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &> /dev/null; then
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
fi
