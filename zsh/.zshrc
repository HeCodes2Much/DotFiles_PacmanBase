# enable xprofiles
zprofile=$HOME/.zprofile

if [ -f "$zprofile" ]; then
    source "$zprofile"
fi

export PATH="$HOME/.basher/bin:$PATH"
eval "$(basher init - zsh)"

ZSH_CUSTOM="$HOME/.config/zsh/"
ZSH_ALIASES="$ZSH_CUSTOM/aliases"
ZSH_PLUGINS="$ZSH_CUSTOM/plugins"
ZSH_THEMES="$ZSH_CUSTOM/themes"

if [ "$TERM" = "linux" ]; then
    printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
    printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
    printf %b '\e]P0282a36'    # redefine 'black'          as 'dracula-bg'
    printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
    printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
    printf %b '\e]P9ff7777'    # redefine 'bright-red'     as '#ff7777'
    printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
    printf %b '\e]PA70fa9b'    # redefine 'bright-green'   as '#70fa9b'
    printf %b '\e]P3f1fa8c'    # redefine 'brown'          as 'dracula-yellow'
    printf %b '\e]PBffb86c'    # redefine 'bright-brown'   as 'dracula-orange'
    printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-purple'
    printf %b '\e]PCcfa9ff'    # redefine 'bright-blue'    as '#cfa9ff'
    printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-pink'
    printf %b '\e]PDff88e8'    # redefine 'bright-magenta' as '#ff88e8'
    printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
    printf %b '\e]PE97e2ff'    # redefine 'bright-cyan'    as '#97e2ff'
    printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-fg'
    printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
    clear
fi

if [ ! "$TERM" = "linux" ]; then
    bfetch --source ~/.config/bfetch/ascii.art --ascii_colors 7 1 2 3 5 8 --birthday 16/06
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
