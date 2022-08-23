#list comamnds
function l
    lsd $argv
end

function ls
    lsd $argv
end

function la
    ls -a
end

function ll
    ls -l
end

function lla
    ls -la
end

function lt
    ls --tree
end

function lg
    ls -A | egrep $argv
end
