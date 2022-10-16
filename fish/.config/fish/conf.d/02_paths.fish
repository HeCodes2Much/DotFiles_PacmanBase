set PATH "$HOME/.local/bin:$PATH"

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

# Adds `~/.local/bin/scratch` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.local/bin/scratch"
    set PATH "$HOME/.local/bin/scratch:$PATH"
end

# Adds `~/.local/bin/lemonbar` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.local/bin/lemonbar"
    set PATH "$HOME/.local/bin/lemonbar:$PATH"
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

set PATH $(printf %s "$PATH" | awk -vRS=: '!a[$0]++' | paste -s -d:)
