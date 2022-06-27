#!/usr/bin/env bash

if pgrep -x "stalonetray" > /dev/null
then
    killall stalonetray &
else
    stalonetray &
fi
