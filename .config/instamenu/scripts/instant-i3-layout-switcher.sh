#!/usr/bin/env bash

OPENPROGRAMS=$HOME/.config/instamenu/configs/i3-layout-switcher.ini
asksetting() {
while read line; do
# reading each line
echo $line
done < $OPENPROGRAMS | instamenu -c -l 10 -w -400 -i -h -1 -bw 4 -q "${1:-Search...}"
}

while [ -n "$1" ]; do
    case $1 in
        "mainCenter")
            echo "mainCenter" | i3-instant-layout - && exit 1
        ;;
        *) 
            echo "Program terminated." && exit 1
        ;;
    esac
done

LOOPSETTING="true"
while [ -n "$LOOPSETTING" ]; do
    CHOICE="$(asksetting)"
    [ -n "$CHOICE" ] || exit
    unset LOOPSETTING
    case "$CHOICE" in
        $CHOICE)
            echo "$CHOICE" | i3-instant-layout - && exit 1
        ;;
        *)
            echo "Program terminated." && exit 1
        ;;
    esac
done

