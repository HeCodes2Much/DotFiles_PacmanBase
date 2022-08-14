xset b off
setxkbmap -layout gb
setxkbmap -option caps:super

xprofile=$HOME/.xprofile

# enable xprofiles
if [ -f "$xprofile" ]; then
    source "$xprofile"
fi

# enable XDG_CONFIG_HOME
if [[ -z "$XDG_CONFIG_HOME" ]]
then
        export XDG_CONFIG_HOME="$HOME/.config/"
fi

# Autostart X using startx after tty login.
#if [[ ! ${DISPLAY} && ${XDG_VTNR} == 1 ]] && [[ $(tty) = /dev/tty1 ]]; then
#    exec tbsm
#fi
