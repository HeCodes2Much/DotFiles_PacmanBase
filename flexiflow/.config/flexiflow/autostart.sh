#!/usr/bin/env bash
#-*-coding:utf-8 -*-
#Auto updated?
#   Yes
#File:
#   autostart.sh
#Author:
#   The-Repo-Club [wayne6324@gmail.com]
#Github:
#   https://github.com/The-Repo-Club/
#
#Created:
#   Mon 22 November 2021, 03:15:54 PM [GMT]
#Modified:
#   Mon 21 August 2023, 11:16:21 PM [GMT+1]
#
#Description:
#   <Todo>
#
#Dependencies:
#   <None>
#

if command -v flexiflow_bar &>/dev/null; then
  if ! pgrep -f "flexiflow_bar" >/dev/null; then
    flexiflow_bar &
  else
    echo "flexiflow_bar already Running"
  fi
fi

if command -v /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &>/dev/null; then
  if ! pgrep -f "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" >/dev/null; then
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
  else
    echo "polkit-gnome already Running"
  fi
fi

if command -v xcompmgr &>/dev/null; then
  if ! pgrep -x "xcompmgr" >/dev/null; then
    xcompmgr &
  else
    echo "xcompmgr already Running"
  fi
else
  echo "xcompmgr could not be found"
fi

####################
## Fix Background ##
####################
if command -v feh &>/dev/null; then
  if ! test -f "$HOME/.fehbg"; then
    echo "$HOME/.fehbg could not be found"
  else
    sh "$HOME/.fehbg"
    (
      sleep 2s
      sh "$HOME/.fehbg"
    ) &
  fi
else
  echo "feh could not be found"
fi

###############
## Auto Lock ##
###############

if command -v xautolock &>/dev/null; then
  # shellcheck disable=SC2155
  if ! pgrep -x "xautolock" >/dev/null; then
    (
      sleep 2s
      xautolock \
        -time 15 -locker "multimonitorlock -l -- --time-str=%I:%M:%S %p" \
        -detectsleep
    ) &
  else
    echo "xautolock already Running"
  fi
else
  echo "xautolock could not be found"
fi

if command -v xss-lock &>/dev/null; then
  # shellcheck disable=SC2155
  if ! pgrep -x "xss-lock" >/dev/null; then
    (
      sleep 2s
      xss-lock -- multimonitorlock -l -- --time-str="%I:%M:%S %p"
    ) &
  else
    echo "xss-lock already Running"
  fi
else
  echo "xss-lock could not be found"
fi

################
## Other Junk ##
################

systemctl --user import-environment DISPLAY XAUTHORITY

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
  dbus-update-activation-environment DISPLAY XAUTHORITY
fi

# see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval "$(/usr/bin/gnome-keyring-daemon --start)"
export SSH_AUTH_SOCK

# see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings
