#!/usr/bin/env bash

#The text that would change color
if pgrep -x "xcompmgr" >/dev/null; then
  echo -n "xComp On"
else
  echo -n "xComp Off"
fi
