#!/usr/bin/env bash

OPENPROGRAMS=$HOME/.config/instamenu/configs/edit-configs.ini
asksetting() {
while read line; do
# reading each line
echo $line
done < $OPENPROGRAMS | instamenu -c -l 10 -w -400 -i -h -1 -bw 4 -q "${1:-Search...}"
}

LOOPSETTING="true"
while [ -n "$LOOPSETTING" ]; do
    CHOICE="$(asksetting)"
    [ -n "$CHOICE" ] || exit
    unset LOOPSETTING
    case "$CHOICE" in
        Awesome)
            CHOICE="$HOME/.config/awesome/rc.lua"
        ;;
        Bash)
            CHOICE="$HOME/.bashrc"
        ;;
        Picom)
            CHOICE="$HOME/.config/i3/picom.conf"
        ;;
        i3)
            CHOICE="$HOME/.config/i3/config"
        ;;
        Pacman)
            CHOICE="/etc/pacman.conf"
        ;;
        PolyBar)
            CHOICE="$HOME/.config/polybar/config"
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
    code "$CHOICE"
done
