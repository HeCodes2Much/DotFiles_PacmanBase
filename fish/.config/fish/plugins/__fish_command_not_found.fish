# If an old handler already exists, defer to that.
function fish_command_not_found
    if test -f /usr/libexec/pk-command-not-found
        /usr/libexec/pk-command-not-found $argv[1]
    end
end

function __fish_command_not_found_handler --on-event fish_command_not_found
    fish_command_not_found $argv
end
