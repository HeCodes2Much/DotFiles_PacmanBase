#!/bin/bash

check_install() {
     if [[ ! $(type $1 2>/dev/null) ]]; then
          echo "Error: missing command '$1'. Exiting."
          exit 1
     fi
}

check_install xdo
check_install xprop

if pgrep -x "polybar" > /dev/null
then
	killall polybar
else
	~/.config/polybar/launch.sh
fi
