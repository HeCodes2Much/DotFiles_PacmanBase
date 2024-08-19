set PATH "$HOME/.local/bin:$PATH"


# Adds `/opt/flutter/bin` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "/opt/flutter/bin"
    set PATH "/opt/flutter/bin:$PATH"
end

# Adds `ANDROID_HOME/tools` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$ANDROID_HOME/tools"
    set PATH "$ANDROID_HOME/tools:$PATH"
end

# Adds `ANDROID_HOME/tools/bin` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$ANDROID_HOME/tools/bin"
    set PATH "$ANDROID_HOME/tools/bin:$PATH"
end

# Adds `ANDROID_HOME/platform-tools` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$ANDROID_HOME/platform-tools"
    set PATH "$ANDROID_HOME/platform-tools:$PATH"
end

# Adds `~/.config/composer/vendor/bin` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.config/composer/vendor/bin"
    set PATH "$HOME/.config/composer/vendor/bin:$PATH"
end

# Adds `~/.local/share/gem/ruby/3.0.0/bin` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.local/share/gem/ruby/3.0.0/bin"
    set GEM_HOME "$HOME/.local/share/gem/ruby/3.0.0"
    set PATH "$HOME/.local/share/gem/ruby/3.0.0/bin:$PATH"
end

# Adds `~/.cargo/bin` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.cargo/bin"
    set PATH "$HOME/.cargo/bin:$PATH"
end

# Adds `~/.local/bin/flexiflow_bar` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.local/bin/flexiflow_bar"
    set PATH "$HOME/.local/bin/flexiflow_bar:$PATH"
end

# Adds `~/.local/bin/rofi` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.local/bin/rofi"
    set PATH "$HOME/.local/bin/rofi:$PATH"
end

# Adds `~/.local/bin/fzf` to $PATH
# set PATH so it includes user's private bin if it exists
if test -d "$HOME/.local/bin/fzf"
    set PATH "$HOME/.local/bin/fzf:$PATH"
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
