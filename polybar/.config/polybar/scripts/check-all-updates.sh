#!/usr/bin/env bash

updates=$(checkupdates | wc -l)

if [ ! -z "${updates##*[!0-9]*}" ]; then
    echo "${updates:0:5} Updates"
else
    echo "Error checking for updates"
fi
