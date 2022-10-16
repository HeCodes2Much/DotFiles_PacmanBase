#!/usr/bin/env bash

# Multi monitor support. Needs MONITOR environment variable to be set for each instance of polybar
# If MONITOR environment variable is not set this will default to monitor 0
# Check https://github.com/polybar/polybar/issues/763
MON_IDX="0"
mapfile -t MONITOR_LIST < <(polybar --list-monitors | cut -d":" -f1)
for ((i = 0; i < $((${#MONITOR_LIST[@]})); i++)); do
    [[ ${MONITOR_LIST[${i}]} == "$MONITOR" ]] && MON_IDX="$i"
done
re='^[0-9]+$'

herbstclient --idle "tag_*" 2>/dev/null | {

    while true; do
        # Read tags into $tags as array
        IFS=$'\t' read -ra tags <<<"$(herbstclient tag_status "${MON_IDX}")"
        {
            for i in "${tags[@]}"; do
                if [[ ${i:1} =~ $re ]]; then
                    # Read the prefix from each tag and render them according to that prefix
                    case ${i:0:1} in
                    '.')
                        # the tag is empty
                        # echo "%{B#283036}%{F#e5e9f0}%{u#283036}%{+u}"
                        # # focus the monitor of the current bar before switching tags
                        # echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${i:1} %{A -u -o F- B-}"
                        ;;
                    ':')
                        # the tag is not empty
                        echo "%{B#59ff59}%{u#a6ffa6}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${i:1} %{A -u -o F- B-}"
                        ;;
                    '+')
                        # the tag is viewed on the specified MONITOR, but this monitor is not focused.
                        echo "%{B#ff9c59}%{u#ffc9a6}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${i:1} %{A -u -o F- B-}"
                        ;;
                    '#')
                        # the tag is viewed on the specified MONITOR and it is focused.
                        echo "%{B#59fff9}%{u#a6fffc}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${i:1} %{A -u -o F- B-}"
                        ;;
                    '-')
                        # the tag is viewed on a different MONITOR, but this monitor is not focused.
                        echo "%{B#ff59f9}%{u#ffa6fc}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${i:1} %{A -u -o F- B-}"
                        ;;
                    '%')
                        # the tag is viewed on a different MONITOR and it is focused.
                        echo "%{B#9059ff}%{u#c5a6ff}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${i:1} %{A -u -o F- B-}"
                        ;;
                    '!')
                        # the tag contains an urgent window
                        echo "%{B#ff5959}%{u#ffa6a6}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${i:1} %{A -u -o F- B-}"
                        ;;
                    esac
                    # reset foreground and background color to default
                    echo "%{F-}%{B-}"
                fi
            done
        } | tr -d "\n"

        echo

        # wait for next event from herbstclient --idle
        read -r || break
    done
} 2>/dev/null
