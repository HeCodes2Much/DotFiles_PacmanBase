#!/usr/bin/env bash

OPENPROGRAMS=$HOME/.config/instamenu/configs/i3-empty-workspace.ini
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
        MultiMC)
            CHOICE="11.1. MultiMC"
        ;;
        *)
            echo "Program terminated." && exit 1
        ;;
    esac
    i3-msg workspace ${CHOICE}
done

