#!/usr/bin/env bash

getsettings() {
  TERMINAL=$(gsettings get org.therepoclub.repomenu.preferences terminal | sed s/\'//g)
  WEBBROWSER=$(gsettings get org.therepoclub.repomenu.preferences webbrowser | sed s/\'//g)
  FILEMANAGER=$(gsettings get org.therepoclub.repomenu.preferences filemanager | sed s/\'//g)
  MAILREADER=$(gsettings get org.therepoclub.repomenu.preferences mailreader | sed s/\'//g)
  TEXTEDITOR=$(gsettings get org.therepoclub.repomenu.preferences texteditor | sed s/\'//g)
  HYPERVISOR=$(gsettings get org.therepoclub.repomenu.preferences hypervisor | sed s/\'//g)
  GITBROWSER=$(gsettings get org.therepoclub.repomenu.preferences gitbrowser | sed s/\'//g)
}

OPENPROGRAMS=$HOME/.config/repomenu/configs/edit-configs.ini
asksetting() {
  while read line; do
    # reading each line
    echo $line
  done <$OPENPROGRAMS | repomenu -c -l 10 -w -400 -i -h -1 -bw 4 -q "${1:-Search...}"
}

LOOPSETTING="true"
while [ -n "$LOOPSETTING" ]; do
  CHOICE="$(asksetting)"
  [ -n "$CHOICE" ] || exit
  unset LOOPSETTING
  getsettings
  case "$CHOICE" in
  Awesome)
    CHOICE="$HOME/.config/awesome/rc.lua"
    ;;
  Bash)
    CHOICE="$HOME/.bashrc"
    ;;
  i3)
    CHOICE="$HOME/.config/i3/config"
    ;;
  Pacman)
    CHOICE="/etc/pacman.conf"
    ;;
  PolyBar)
    CHOICE="$HOME/.config/polybar/config_top.ini"
    ;;
  Kitty)
    CHOICE="$HOME/.config/kitty/kitty.conf"
    ;;
  xResources)
    CHOICE="$HOME/.Xresources"
    ;;
  ZSH)
    CHOICE="$HOME/.zshrc"
    ;;
  *)
    echo "Program terminated." && exit 1
    ;;
  esac
  $TEXTEDITOR "$CHOICE"
done
