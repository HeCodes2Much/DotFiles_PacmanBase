#!/usr/bin/env bash
# -*-coding:utf-8 -*-
# Auto updated?
#   Yes
#File :
#   xcompmgr
#Author:
#   The-Repo-Club [wayne6324@gmail.com]
#Github:
#   https://github.com/The-Repo-Club/
#
# Created:
#   Thu 20 January 2022, 04:40:13 PM [GMT]
# Modified:
#   Mon 21 August 2023, 11:20:19 PM [GMT+1]
#
# Description:
#   <Todo>
#

# https://github.com/jaagr/polybar/wiki/User-contributed-modules

#The icon that would change color
if pgrep -x "xcompmgr" >/dev/null; then
  echo "Loaded"
else
  echo "UnLoaded"
fi
