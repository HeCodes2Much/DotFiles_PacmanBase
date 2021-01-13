#!/usr/bin/env bash

OPENPROGRAMS=$HOME/.config/instamenu/configs/open-programs.ini
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
        Vim)
            CHOICE="alacritty --title=vim --class=vim,vim -e vim"
        ;;
        GoDot)
            CHOICE="godot"
        ;;
        gParted)
            CHOICE="gparted"
        ;;
        MultiMC)
            CHOICE="prime-run multimc"
        ;;
        Steam)
            CHOICE="prime-run steam"
        ;;
        Tiled)
            CHOICE="tiled"
        ;;
        *)
            echo "Program terminated." && exit 1
        ;;
    esac
    $CHOICE
done

