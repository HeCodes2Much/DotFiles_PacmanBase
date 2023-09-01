#!/usr/bin/env bash

if pgrep -x "xcompmgr" >/dev/null; then
  killall xcompmgr
else
  xcompmgr &
fi
