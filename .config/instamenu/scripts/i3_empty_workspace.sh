#!/bin/bash

asksetting() {
    echo ">>h Create a Workspace
MultiMC" | instamenu -c -l 10 -w -400 -i -h -1 -bw 4 -q "${1:-Search...}"
}

LOOPSETTING="true"
while [ -n "$LOOPSETTING" ]; do
    EMPTY_WORKSPACE="$(asksetting)"
    unset LOOPSETTING
    case "$EMPTY_WORKSPACE" in
		MultiMC)
			EMPTY_WORKSPACE="11.1. MultiMC"
		;;
		*)
			echo "Program terminated." && exit 1
		;;
	esac
	i3-msg workspace ${EMPTY_WORKSPACE}
done

