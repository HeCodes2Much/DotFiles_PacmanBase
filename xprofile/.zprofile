xset b off
setxkbmap -layout gb
setxkbmap -option caps:super

xprofile=$HOME/.xprofile

# enable xprofiles
if [ -f "$xprofile" ]; then
  source "$xprofile"
fi

# enable XDG_CONFIG_HOME
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME="$HOME/.config/"
fi
