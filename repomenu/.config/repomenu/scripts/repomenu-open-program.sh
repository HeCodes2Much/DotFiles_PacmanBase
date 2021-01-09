#!/usr/bin/env bash

OPENPROGRAMS=$HOME/.config/repomenu/configs/open-programs.ini
asksetting() {
while read line; do
# reading each line
echo $line
done < $OPENPROGRAMS | repomenu -c -l 15 -w -400 -i -h -1 -bw 4 -q "${1:-Search...}" -wm
}

LOOPSETTING="true"
while [ -n "$LOOPSETTING" ]; do
    CHOICE="$(asksetting)"
    [ -n "$CHOICE" ] || exit
    unset LOOPSETTING
    case "$CHOICE" in
        *Vim)
            CHOICE="gvim"
        ;;
        *GoDot)
            CHOICE="godot"
        ;;
        *gParted)
            CHOICE="gparted"
        ;;
        *MultiMC)
            CHOICE="prime-run multimc"
        ;;
        *Steam)
            CHOICE="prime-run steam"
        ;;
        *Tiled)
            CHOICE="tiled"
        ;;
        *)
            echo "Program terminated." && exit 1
        ;;
    esac
    $CHOICE
done

