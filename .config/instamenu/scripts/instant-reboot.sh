#!/usr/bin/env bash
#
getuptime() {
    uptime = uptime -p | awk '{first = $1; $1 = ""; print $0; }'
    echo -n "${uptime}"
}

asksetting() {
    options=":g Lock
:r 望Sleep
:b Logout
:r Restart
:r 襤Shutdown"

    echo ">>h Uptime: $(getuptime)
$options" | instamenu -wm -c -l 10 -w -400 -i -h -1 -bw 4 -q "${1:-Search...}"
}

LOOPSETTING="true"
while [ -n "$LOOPSETTING" ]; do
    CHOICE="$(asksetting)"
    [ -n "$CHOICE" ] || exit
    unset LOOPSETTING
   if [[ $CHOICE = "Logout" ]]; then
       pkill $DESKTOP_SESSION
    elif [[ $chosen = "Shutdown" ]]; then
	   systemctl poweroff
    elif [[ $chosen = "Restart" ]]; then
	   systemctl reboot
    elif [[ $chosen = "Sleep" ]]; then
	   systemctl suspend
    else
        echo "Program terminated." && exit 1
    fi
done
