function sync_history --on-event fish_preexec
    history --save
    history --merge
end
