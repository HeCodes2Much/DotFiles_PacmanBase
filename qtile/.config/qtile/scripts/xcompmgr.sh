#!/usr/bin/env bash

# https://github.com/jaagr/polybar/wiki/User-contributed-modules

#The icon that would change color
if pgrep -x "xcompmgr" >/dev/null; then
  echo -n "Loaded"
else
  echo -n "UnLoaded"
fi
