#!/bin/bash
asksetting() {
	options=$(i3-msg -t get_workspaces | tr ',' '\n' | grep "name" | sed 's/"name":"\(.*\)"/\1/g' | sort -n)

    echo ">>h Create a Workspace
$options" | instamenu -c -l 10 -w -400 -i -h -1 -bw 4 -q "${1:-Search...}"
}

LOOPSETTING="true"
while [ -n "$LOOPSETTING" ]; do
    WORKSPACE="$(asksetting)"
    unset LOOPSETTING
    case "$WORKSPACE" in
		$WORKSPACE)
			WORKSPACE="$WORKSPACE"
		;;
		*)
			echo "Program terminated." && exit 1
		;;
	esac
	i3-msg workspace "${WORKSPACE}" >/dev/null
done

