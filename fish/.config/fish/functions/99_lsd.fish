#list comamnds
function l
    exa $argv
end

function ls
    exa $argv
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
    ls -a | egrep $argv
end
