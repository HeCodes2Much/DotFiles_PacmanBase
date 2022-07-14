#!/usr/bin/env bash
#-*-coding:utf-8 -*-
#Auto updated?
#   Yes
#File :
#   autostart.sh
#Author :
#   The-Repo-Club [wayne6324@gmail.com]
#Github :
#   https://github.com/The-Repo-Club/
#
#Created:
#   Mon 22 November 2021, 03:15:54 PM [GMT]
#Last edited:
#   Fri 08 July 2022, 07:18:26 AM [GMT+1]
#
#Description:
#   <Todo>
#
#Dependencies:
#   <None>
#

# if command -v autorandr &>/dev/null; then
#   if ! pgrep -f "autorandr" >/dev/null; then
#     autorandr --force --load repowm &
#   else
#     echo "autorandr already Running"
#   fi
# fi

if command -v /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &>/dev/null; then
  if ! pgrep -f "/usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1" >/dev/null; then
    /usr/lib/polkit-gnome/polkit-gnome-authentication-agent-1 &
  else
    echo "polkit-gnome already Running"
  fi
fi

# if command -v xroot &>/dev/null; then
#   if ! pgrep -f "xroot" >/dev/null; then
#     xroot -r xmenu_desktop &
#   else
#     echo "xroot already Running"
#   fi
# fi

# if command -v clipmenu-daemon &>/dev/null; then
#   if ! pgrep -f "clipmenu-daemon" >/dev/null; then
#     clipmenu-daemon &
#   else
#     echo "clipmenu-daemon already Running"
#   fi
# fi

if ! command -v feh &>/dev/null; then
  echo "feh could not be found"
else
  if ! test -f "$HOME/.fehbg"; then
    echo "$HOME/.fehbg could not be found"
  else
    sh "$HOME/.fehbg"
    sleep 2s
    sh "$HOME/.fehbg"
  fi
fi

if ! command -v picom &>/dev/null; then
  echo "picom could not be found"
  exit
else
  if ! pgrep -x "picom" >/dev/null; then
    picom -b --experimental-backend --config $HOME/.config/repowm/picom.conf &
  else
    echo "picom already Running"
  fi
fi

# ################
# ## Tray Icons ##
# ################

# if ! command -v ckb-next &>/dev/null; then
#   echo "ckb-next could not be found"
# else
#   if ! pgrep -x "ckb-next" >/dev/null; then
#     ckb-next --background &
#   else
#     echo "ckb-next already Running"
#   fi
# fi

# if command -v nm-applet &>/dev/null; then
#   if ! pgrep -x "nm-applet" >/dev/null; then
#     nm-applet &
#   else
#     echo "nm-applet already Running"
#   fi
# fi

# if command -v blueman-applet &>/dev/null; then
#   if ! pgrep -x "blueman-applet" >/dev/null; then
#     blueman-applet &
#   else
#     echo "blueman-applet already Running"
#   fi
# fi

# if command -v touchpad-indicator &>/dev/null; then
#   if ! pgrep -f "touchpad-indicator" >/dev/null; then
#     touchpad-indicator &
#   else
#     echo "touchpad-indicator already Running"
#   fi
# fi

# if command -v numlockx &>/dev/null; then
#   numlockx on &
# fi

# if command -v volumeicon &>/dev/null; then
#   if ! pgrep -x "volumeicon" >/dev/null; then
#     volumeicon &
#   else
#     echo "volumeicon already Running"
#   fi
# fi

# ###############
# ## Auto Lock ##
# ###############

if command -v xidlehook &>/dev/null; then
  # shellcheck disable=SC2155
  export PRIMARY_DISPLAY="$(xrandr | awk '/ primary/{print $1}')"
  if ! pgrep -x "xidlehook" >/dev/null; then
    xidlehook \
      --not-when-fullscreen \
      --not-when-audio \
      --timer 300 \
      "xrandr --output $PRIMARY_DISPLAY --brightness .1" \
      "xrandr --output $PRIMARY_DISPLAY --brightness 1" \
      --timer 30 \
      "xrandr --output $PRIMARY_DISPLAY --brightness 1; multimonitorlock -l -- --time-str=%I:%M:%S %p" \
      "" \
      --timer 3600 \
      "systemctl suspend" \
      ""
  else
    echo "xidlehook already Running"
  fi
fi

# ################
# ## Other Junk ##
# ################

systemctl --user import-environment DISPLAY XAUTHORITY

if command -v dbus-update-activation-environment >/dev/null 2>&1; then
  dbus-update-activation-environment DISPLAY XAUTHORITY
fi

# # see https://wiki.archlinux.org/title/GNOME/Keyring#xinitrc
eval "$(/usr/bin/gnome-keyring-daemon --start)"
export SSH_AUTH_SOCK

# # see https://github.com/NixOS/nixpkgs/issues/14966#issuecomment-520083836
mkdir -p "$HOME"/.local/share/keyrings
