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
    printf %b '\e]P021222c'    # redefine 'black'          as 'dracula-bg'
    printf %b '\e]P86272a4'    # redefine 'bright-black'   as 'dracula-comment'
    printf %b '\e]P1ff5555'    # redefine 'red'            as 'dracula-red'
    printf %b '\e]P9ff6e6e'    # redefine 'bright-red'     as '#ff6e6e'
    printf %b '\e]P250fa7b'    # redefine 'green'          as 'dracula-green'
    printf %b '\e]PA69ff94'    # redefine 'bright-green'   as '#69ff94'
    printf %b '\e]P3f1fa8c'    # redefine 'yellow'         as 'dracula-yellow'
    printf %b '\e]PBffffa5'    # redefine 'bright-yellow'  as '#ffffa5'
    printf %b '\e]P4bd93f9'    # redefine 'blue'           as 'dracula-blue'
    printf %b '\e]PCd6acff'    # redefine 'bright-blue'    as '#cfa9ff'
    printf %b '\e]P5ff79c6'    # redefine 'magenta'        as 'dracula-magenta'
    printf %b '\e]PDff92df'    # redefine 'bright-magenta' as '#ff88e8'
    printf %b '\e]P68be9fd'    # redefine 'cyan'           as 'dracula-cyan'
    printf %b '\e]PEa4ffff'    # redefine 'bright-cyan'    as '#a4ffff'
    printf %b '\e]P7f8f8f2'    # redefine 'white'          as 'dracula-white'
    printf %b '\e]PFffffff'    # redefine 'bright-white'   as '#ffffff'
    clear
fi

bfetch --source ~/.config/bfetch/ascii.art --ascii_colors 7 1 2 3 5 8 --birthday 16/06

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
