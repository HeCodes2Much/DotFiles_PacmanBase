xprofile=$HOME/.xprofile

# enable xprofiles
if [ -f "$xprofile" ]; then
    source "$xprofile"
fi

# Autostart X using startx after tty login.
if [[ ! ${DISPLAY} && ${XDG_VTNR} == 1 ]] && [[ $(tty) = /dev/tty1 ]]; then
    exec tbsm
fi
