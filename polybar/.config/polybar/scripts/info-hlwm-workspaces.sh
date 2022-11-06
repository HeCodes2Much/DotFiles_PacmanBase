#!/usr/bin/env bash

# shellcheck disable=SC2034

## Set Colors (copied from makepkg)
b_blk="#283036"
b_red="#ffa6a6"
b_grn="#a6ffa6"
b_yel="#ffffa6"
b_pnk="#ffa6fc"
b_pur="#c5a6ff"
b_cyn="#a6fffc"
b_org="#ffc9a6"
b_wht="#e5e9f0"
blk="#283036"
red="#ff5959"
grn="#59ff59"
yel="#ffff59"
pnk="#ff59f9"
pur="#9059ff"
cyn="#59fff9"
org="#ff9c59"
wht="#e5e9f0"

readonly b_blk b_red b_grn b_yel b_pnk b_pur b_cyn b_org b_wht blk red grn yel pnk pur cyn org wht

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
                    if [[ ${i:1} -eq 1 ]]; then
                        tag="${i:1}: 一"
                    elif [[ ${i:1} -eq 2 ]]; then
                        tag="${i:1}: 二"
                    elif [[ ${i:1} -eq 3 ]]; then
                        tag="${i:1}: 三"
                    elif [[ ${i:1} -eq 4 ]]; then
                        tag="${i:1}: 四"
                    elif [[ ${i:1} -eq 5 ]]; then
                        tag="${i:1}: 五"
                    elif [[ ${i:1} -eq 6 ]]; then
                        tag="${i:1}: 六"
                    elif [[ ${i:1} -eq 7 ]]; then
                        tag="${i:1}: 七"
                    elif [[ ${i:1} -eq 8 ]]; then
                        tag="${i:1}: 八"
                    elif [[ ${i:1} -eq 9 ]]; then
                        tag="${i:1}: 九"
                    elif [[ ${i:1} -eq 0 ]]; then
                        tag="${i:1}: 零"
                    else
                        tag="${i:1}: "
                    fi

                    # Read the prefix from each tag and render them according to that prefix
                    case ${i:0:1} in
                    '.')
                        # the tag is empty
                        # echo "%{B${cyn}}%{u${b_cyn}}%{+u}"
                        # # # focus the monitor of the current bar before switching tags
                        # echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${tag} %{A -u -o F- B-}"
                        ;;
                    ':')
                        # the tag is not empty
                        echo "%{B${yel}}%{u${b_yel}}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${tag} %{A -u -o F- B-}"
                        ;;
                    '+')
                        # the tag is viewed on the specified MONITOR, but this monitor is not focused.
                        echo "%{B${grn}}%{u${b_grn}}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${tag} %{A -u -o F- B-}"
                        ;;
                    '#')
                        # the tag is viewed on the specified MONITOR and it is focused.
                        echo "%{B${grn}}%{u${b_grn}}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${tag} %{A -u -o F- B-}"
                        ;;
                    '-')
                        # the tag is viewed on a different MONITOR, but this monitor is not focused.
                        #echo "%{B#ff59f9}%{u#ffa6fc}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        #echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${tag} %{A -u -o F- B-}"
                        ;;
                    '%')
                        # the tag is viewed on a different MONITOR and it is focused.
                        #echo "%{B#9059ff}%{u#c5a6ff}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        #echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${tag} %{A -u -o F- B-}"
                        ;;
                    '!')
                        # the tag contains an urgent window
                        echo "%{B${red}}%{u${b_red}}%{+u}"
                        # focus the monitor of the current bar before switching tags
                        echo "%{A1:herbstclient focus_monitor ${MON_IDX}; herbstclient use ${i:1}:} ${tag} %{A -u -o F- B-}"
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
