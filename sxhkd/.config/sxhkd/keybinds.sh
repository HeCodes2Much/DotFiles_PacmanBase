#!/usr/bin/env bash
# -*-coding:utf-8 -*-
# Auto updated?
#   Yes
#File :
#   keybinds
#Author:
#   The-Repo-Club [wayne6324@gmail.com]
#Github:
#   https://github.com/The-Repo-Club/
#
# Created:
#   Wed 10 March 2021, 12:34:47 PM [GMT]
# Modified:
#   Sun 06 November 2022, 06:53:30 PM [GMT]
#
# Description:
#   <Todo>
#

cmd="\grep -A 1 Description $HOME/.config/sxhkd/sxhkdrc | sed -e s/--/\ /g"
case $1 in
fzf)
    cmd="$cmd -e s/Description:\ //gI" && eval "$cmd" | sed -e 's/[\\$]//g' | sed -e 's/_b//g' | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | fzf
    ;;
yad)
    cmd="$cmd -e s/Description:\ //gI" && eval "$cmd" | sed -e 's/[\\$]//g' | sed -e 's/_b//g' | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | yad --text-info --width=800 --height=800
    ;;
dmenu)
    cmd="$cmd -e s/Description:\ //gI" && eval "$cmd" | sed -e 's/[\\$]//g' | sed -e 's/_b//g' | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | dmenu -l 10 -p "Search Keybind"
    ;;
rofi)
    cmd="$cmd -e s/Description:\ //gI" && eval "$cmd" | sed -e 's/[\\$]//g' | sed -e 's/_b//g' | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | rofi -dmenu -i -width 1000 -p "Search Keybind"
    ;;
*)
    cmd="$cmd -e s/Description:\ //gI" && eval "$cmd" | sed -e 's/[\\$]//g' | sed -e 's/_b//g' | awk '/^[a-z]/ && last {print last,$0,";"} {last=""} /^#/{last=$0}' | column -t -s ';' | yad --text-info --width=800 --height=800
    ;;
esac
