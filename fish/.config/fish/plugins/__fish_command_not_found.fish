# If an old handler already exists, defer to that.
function fish_command_not_found
    set -l paths $argv[1]
    set -l pkgs $(pkgfile -b -- "$argv[1]")
    # If we've not been given an absolute path, try $PATH as the starting point,
    # otherwise pacman will try *every path*, and e.g. bash-completion
    # isn't helpful.
    string match -q '/*' -- $argv[1]; or set paths $PATH/$argv[1]

    if set -q pkgs[1]
        printf '%s may be found in the following packages:\n' "$argv[1]"
        # Pacman only prints the path, so we still need to print the error.
        pacman -F $paths

        # while true
        #     read -l -P "Would you like to install $pkgs[1]? [Y/n] " confirm

        #     switch $confirm
        #         case Y y
        #             pacman -S $pkgs[1]
        #             return
        #         case N n
        #             return
        #     end
        # end
    end
end
