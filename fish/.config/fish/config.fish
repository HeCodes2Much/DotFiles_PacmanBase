if test -f "$HOME/.confid/fish/fish.profile"
    source "$HOME/.confid/fish/fish.profile"
end


set PATH "$HOME/.local/bin:$PATH"

if test -d "$HOME/.basher/bin"
    set PATH "$HOME/.basher/bin:$PATH"
    status --is-interactive; and source (basher init - fish|psub)
end

# Adds `~/.config/composer/vendor/bin` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.config/composer/vendor/bin"
    set PATH "$HOME/.config/composer/vendor/bin:$PATH"
end

# Adds `~/.local/bin/repobar` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.local/bin/repobar"
    set PATH "$HOME/.local/bin/repobar:$PATH"
end

# Adds `~/.local/bin/discord_bot` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.local/bin/discord_bot"
    set PATH "$HOME/.local/bin/discord_bot:$PATH"
end

# Adds `~/.local/bin/clipmenu` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.local/bin/clipmenu"
    set PATH "$HOME/.local/bin/clipmenu:$PATH"
end


function fish_greeting
    if status --is-login
        if test (tty)
            printf %b '\e[40m' '\e[8]' # set default background to color 0 'dracula-bg'
            printf %b '\e[37m' '\e[8]' # set default foreground to color 7 'dracula-fg'
            printf %b '\e]P0282a36' # redefine 'black'          as 'dracula-bg'
            printf %b '\e]P86272a4' # redefine 'bright-black'   as 'dracula-comment'
            printf %b '\e]P1ff5555' # redefine 'red'            as 'dracula-red'
            printf %b '\e]P9ff7777' # redefine 'bright-red'     as '#ff7777'
            printf %b '\e]P250fa7b' # redefine 'green'          as 'dracula-green'
            printf %b '\e]PA70fa9b' # redefine 'bright-green'   as '#70fa9b'
            printf %b '\e]P3f1fa8c' # redefine 'brown'          as 'dracula-yellow'
            printf %b '\e]PBffb86c' # redefine 'bright-brown'   as 'dracula-orange'
            printf %b '\e]P4bd93f9' # redefine 'blue'           as 'dracula-purple'
            printf %b '\e]PCcfa9ff' # redefine 'bright-blue'    as '#cfa9ff'
            printf %b '\e]P5ff79c6' # redefine 'magenta'        as 'dracula-pink'
            printf %b '\e]PDff88e8' # redefine 'bright-magenta' as '#ff88e8'
            printf %b '\e]P68be9fd' # redefine 'cyan'           as 'dracula-cyan'
            printf %b '\e]PE97e2ff' # redefine 'bright-cyan'    as '#97e2ff'
            printf %b '\e]P7f8f8f2' # redefine 'white'          as 'dracula-fg'
            printf %b '\e]PFffffff' # redefine 'bright-white'   as '#ffffff'
            clear
        end
    end
    bfetch --source ~/.config/bfetch/ascii.art --ascii_colors 7 1 2 3 5 8 --birthday 16/06
end

# Get all the files inside folder
for file in "$HOME/.config/fish/aliases/"*
    source $file
end

# Keybinding
bind \ec __history_previous_command
bind \e\e __sudope

if status is-login
    if test (tty) = /dev/tty1
        exec tbsm
    end
end
