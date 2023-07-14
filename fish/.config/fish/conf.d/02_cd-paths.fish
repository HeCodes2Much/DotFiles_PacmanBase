set CDPATH "$HOME/.config:$CDPATH"

# Adds `~/.local/bin` to $CDPATH
# set CDPATH so it includes user's private bin if it exists
if test -d "$HOME/.local/bin"
    set CDPATH "$HOME/.local/bin:$CDPATH"
end

set CDPATH $(printf %s "$CDPATH" | awk -vRS=: '!a[$0]++' | paste -s -d:)
