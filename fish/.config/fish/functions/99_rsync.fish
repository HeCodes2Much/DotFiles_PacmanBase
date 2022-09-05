#rsync commands
function rsync-move
    rsync -avz --progress -h --remove-source-files $argv
end

function rsync-synchronize
    rsync -avzu --delete --progress -h $argv
end

function rsync-update
    rsync -avzu --progress -h $argv
end

function rsync-copy
    rsync -avz --progress -h $argv
end
