#!/usr/bin/env bash

#The text that would change color
if pgrep -x "xcompmgr" >/dev/null; then
  echo -n "Loaded"
else
  echo -n "UnLoaded"
fi
