function __history_previous_command
    commandline -t $history[1]
    commandline -f repaint
end