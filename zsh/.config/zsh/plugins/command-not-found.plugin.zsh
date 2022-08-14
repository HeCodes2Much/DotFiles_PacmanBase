command_not_found_handler() {
    local pkgs cmd="$1"

    pkgs=(${(f)"$(pkgfile -b -v -- "$cmd" 2>/dev/null)"})
    if [[ -n "$pkgs" ]]; then
        printf '%s may be found in the following packages:\n' "$cmd"
        pacman -F "$cmd"
        read -r "response?Would you like to install $cmd? [Y/n] "
        response=${response:l} #tolower
        if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
            pkg=$(echo ${pkgs%% *} | awk -F/ '{print $2}')
            pacman -S "$pkg"
        fi
    else
        printf 'zsh: command not found: %s\n' "$cmd"
    fi 1>&2

    return 127
}