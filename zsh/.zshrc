# enable xprofiles
zprofile=$HOME/.zprofile

if [ -f "$zprofile" ]; then
  source "$zprofile"
fi

ZSH_CUSTOM="$HOME/.config/zsh/"
ZSH_ALIASES="$ZSH_CUSTOM/aliases"
ZSH_PLUGINS="$ZSH_CUSTOM/plugins"
ZSH_THEMES="$ZSH_CUSTOM/themes"

if [ "$TERM" = "linux" ]; then
  printf %b '\e[40m' '\e[8]' # set default background to color 0 'Minimal-Mistakes-Background'
  printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'Minimal-Mistakes-Foreground'
  printf %b '\e]P0283036'    # redefine 'Background'     as 'Minimal-Mistakes-Background'
  printf %b '\e]P8434c5e'    # redefine 'Selection'      as 'Minimal-Mistakes-Selection'
  printf %b '\e]P1ff5959'    # redefine 'Red'            as 'Minimal-Mistakes-Red'
  printf %b '\e]P9ffa6a6'    # redefine 'Bright-Red'     as 'Minimal-Mistakes-Bright-Red'
  printf %b '\e]P259ff59'    # redefine 'Green'          as 'Minimal-Mistakes-Green'
  printf %b '\e]PAa6ffa6'    # redefine 'Bright-Green'   as 'Minimal-Mistakes-Bright-Green'
  printf %b '\e]P3ffff59'    # redefine 'Yellow'         as 'Minimal-Mistakes-Yellow'
  printf %b '\e]PBffffa6'    # redefine 'Bright-Yellow'  as 'Minimal-Mistakes-Bright-Yellow'
  printf %b '\e]P49059ff'    # redefine 'Purple'         as 'Minimal-Mistakes-Purple'
  printf %b '\e]PCc5a6ff'    # redefine 'Bright-Purple'  as 'Minimal-Mistakes-Bright-Purple'
  printf %b '\e]P5ff59f9'    # redefine 'Pink'           as 'Minimal-Mistakes-Pink'
  printf %b '\e]PDffa6fc'    # redefine 'Bright-Pink'    as 'Minimal-Mistakes-Bright-Pink'
  printf %b '\e]P659fff9'    # redefine 'Cyan'           as 'Minimal-Mistakes-Cyan'
  printf %b '\e]PEa6fffc'    # redefine 'Bright-Cyan'    as 'Minimal-Mistakes-Bright-Cyan'
  printf %b '\e]P7e5e9f0'    # redefine 'White'          as 'Minimal-Mistakes-Foreground'
  printf %b '\e]PFe5e9f0'    # redefine 'Bright-White'   as 'Minimal-Mistakes-Foreground'
  clear
fi

autoload -U compinit
compinit

#Add aliases into zsh
if [ -d "$ZSH_ALIASES" ]; then
  for file in "$ZSH_ALIASES"/*; do
    [[ -f "$file" && -r "$file" ]] && source "$file"
  done
fi

#Add plugins into zsh
if [ -d "$ZSH_PLUGINS" ]; then
  for file in "$ZSH_PLUGINS"/*; do
    [[ -f "$file" && -r "$file" ]] && source "$file"
  done
fi

#Add themes into zsh
if [ -d "$ZSH_THEMES" ]; then
  for file in "$ZSH_THEMES"/*; do
    [[ -f "$file" && -r "$file" ]] && source "$file"
  done
fi

eval "$(starship init zsh)"
sf
if [ -e /home/repo/.nix-profile/etc/profile.d/nix.sh ]; then . /home/repo/.nix-profile/etc/profile.d/nix.sh; fi # added by Nix installer
