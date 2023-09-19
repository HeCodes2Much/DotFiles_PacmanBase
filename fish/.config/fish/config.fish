export MICRO_TRUECOLOR=1

for plugins in "$HOME/.config/fish/plugins/"*
    source $plugins
end

for functions in "$HOME/.config/fish/functions/"*
    source $functions
end

# bun
set --export BUN_INSTALL "$HOME/.bun"
set --export PATH $BUN_INSTALL/bin $PATH
