# If an old handler already exists, defer to that.
if type -q pacman
    function fish_command_not_found
        set -l paths $argv[1]
        # If we've not been given an absolute path, try $PATH as the starting point,
        # otherwise pacman will try *every path*, and e.g. bash-completion
        # isn't helpful.
        string match -q '/*' -- $argv[1]; or set paths $PATH/$argv[1]
        # Pacman only prints the path, so we still need to print the error.
        pacman -F $paths
    end
end
