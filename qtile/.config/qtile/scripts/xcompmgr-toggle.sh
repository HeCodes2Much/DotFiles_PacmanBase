#!/usr/bin/env bash

# https://github.com/jaagr/polybar/wiki/User-contributed-modules

#The command for starting compton
#always keep the -b argument!

if pgrep -x "xcompmgr" >/dev/null; then
  killall xcompmgr
else
  xcompmgr &
fi
