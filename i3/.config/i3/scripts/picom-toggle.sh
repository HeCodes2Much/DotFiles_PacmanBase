#!/usr/bin/env bash

# https://github.com/jaagr/polybar/wiki/User-contributed-modules

#The command for starting compton
#always keep the -b argument!

if pgrep -x "picom" > /dev/null
then
	killall picom
else
	picom -CGb --experimental-backend --config ~/.config/i3/picom.conf
fi
