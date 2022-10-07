xset b off
setxkbmap -layout gb
setxkbmap -option caps:super

xprofile=$HOME/.xprofile

# enable xprofiles
if [ -f "$xprofile" ]; then
  source "$xprofile"
fi

if [ -d "/usr/bin/husky" ]; then
  export HUSKY_PATH=""
  HUSKY_PATH="$HOME/.local/share/husky-repo/core"
  HUSKY_PATH="$HOME/.local/share/husky-repo/extra:$HUSKY_PATH"
  HUSKY_PATH="$HOME/.local/share/husky-repo/xorg:$HUSKY_PATH"
  HUSKY_PATH="$HOME/.local/share/husky-repo/wayland:$HUSKY_PATH"
  HUSKY_PATH="$HOME/.local/share/husky-repo/community:$HUSKY_PATH"
  HUSKY_PATH="$HOME/.local/share/husky-repo/games:$HUSKY_PATH"
  HUSKY_PATH="$HOME/.local/share/husky-repo/bin:$HUSKY_PATH"
  HUSKY_PATH="$HOME/.local/share/husky-repo/git:$HUSKY_PATH"
  HUSKY_PATH="$HOME/.local/share/husky-repo/testing:$HUSKY_PATH"
fi

# enable XDG_CONFIG_HOME
if [[ -z "$XDG_CONFIG_HOME" ]]; then
  export XDG_CONFIG_HOME="$HOME/.config/"
fi
