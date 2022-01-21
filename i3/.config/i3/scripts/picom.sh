#!/usr/bin/env bash
# -*-coding:utf-8 -*-
# Auto updated?
#   Yes
#File :
#   picom
#Author:
#   The-Repo-Club [wayne6324@gmail.com]
#Github:
#   https://github.com/The-Repo-Club/
#
# Created:
#   Thu 20 January 2022, 04:40:13 PM [GMT]
# Modified:
#   Fri 21 January 2022, 02:29:56 PM [GMT]
#
# Description:
#   <Todo>
#

# https://github.com/jaagr/polybar/wiki/User-contributed-modules

#The icon that would change color
if pgrep -x "picom" > /dev/null
then
	echo "Loaded"
else
	echo "UnLoaded"
fi
