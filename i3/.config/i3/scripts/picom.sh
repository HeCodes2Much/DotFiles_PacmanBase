#!/usr/bin/env bash

# https://github.com/jaagr/polybar/wiki/User-contributed-modules

#The icon that would change color
if pgrep -x "picom" > /dev/null
then
	echo "Loaded"
else
	echo "UnLoaded"
fi
