#!/usr/bin/env bash
#
asksetting() {
    options=$(i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n)

    echo ">>h Switch to a Workspace
$options" | instamenu -c -l 10 -w -400 -i -h -1 -bw 4 -q "${1:-Search...}"
}

LOOPSETTING="true"
while [ -n "$LOOPSETTING" ]; do
    CHOICE="$(asksetting)"
    [ -n "$CHOICE" ] || exit
    unset LOOPSETTING
    if [ "$CHOICE" ]; then
        i3-msg workspace "${CHOICE}" >/dev/null
    else 
        echo "Program terminated." && exit 1 
    fi
done

