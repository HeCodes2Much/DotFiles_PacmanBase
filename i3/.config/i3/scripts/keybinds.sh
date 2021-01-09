#!/usr/bin/env bash

####
####   _____ _          ____                   ____ _       _
####  |_   _| |__   ___|  _ \ ___ _ __   ___  / ___| |_   _| |__
####    | | | '_ \ / _ \ |_) / _ \ '_ \ / _ \| |   | | | | | '_ \
####    | | | | | |  __/  _ <  __/ |_) | (_) | |___| | |_| | |_) |
####    |_| |_| |_|\___|_| \_\___| .__/ \___/ \____|_|\__,_|_.__/
####                             |_|
####

cmd="\grep -A 1 Description $HOME/.config/i3/config | sed -e s/--/\ /g"
case $1 in
	fzf) cmd="$cmd -e s/Description:\ //gI" && eval "$cmd" | sed -e 's/[\\$]//g' | sed -e 's/_b//g' | sed -e 's/+/ + /g' | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | fzf;;
	yad) cmd="$cmd -e s/Description:\ //gI" && eval "$cmd" | sed -e 's/[\\$]//g' | sed -e 's/_b//g' | sed -e 's/+/ + /g' | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | yad --text-info --width=800 --height=800;;
	dmenu) cmd="$cmd -e s/Description:\ //gI" && echo "$(eval "$cmd")" | sed -e 's/[\\$]//g' | sed -e 's/_b//g' | sed -e 's/+/ + /g' | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | dmenu -l 10 -p "Search Keybind";;
	rofi) cmd="$cmd -e s/Description:\ //gI" && echo "$(eval "$cmd")" | sed -e 's/[\\$]//g' | sed -e 's/_b//g' | sed -e 's/+/ + /g' | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | rofi -dmenu -i -width 1000 -p "Search Keybind";;
	*) cmd="$cmd -e s/Description:\ //gI" && eval "$cmd" | sed -e 's/[\\$]//g' | sed -e 's/_b//g' | sed -e 's/+/ + /g' | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | yad --text-info --width=800 --height=800;;
esac

