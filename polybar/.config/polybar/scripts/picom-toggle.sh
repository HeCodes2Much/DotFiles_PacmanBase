#!/usr/bin/env bash
# -*-coding:utf-8 -*-
# Auto updated?
#   Yes
#File :
#   picom-toggle
#Author:
#   The-Repo-Club [wayne6324@gmail.com]
#Github:
#   https://github.com/The-Repo-Club/
#
# Created:
#   Thu 20 January 2022, 04:40:04 PM [GMT]
# Modified:
#   Sun 06 August 2023, 10:30:30 AM [GMT+1]
#
# Description:
#   <Todo>
#

# https://github.com/jaagr/polybar/wiki/User-contributed-modules

#The command for starting compton
#always keep the -b argument!

if pgrep -x "picom" > /dev/null
then
	killall picom
else
	picom --config ~/.config/picom/picom.conf
fi
