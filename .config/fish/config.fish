export MICRO_TRUECOLOR=1

for themes in "$HOME/.config/fish/themes/"*
    source $themes
end

for plugins in "$HOME/.config/fish/plugins/"*
    source $plugins
end


for functions in "$HOME/.config/fish/functions/"*
    source $functions
end
