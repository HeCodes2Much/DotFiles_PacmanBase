#github commands
function g
    git $argv
end

function gadd
    git add $argv
end

function gbranch
    git branch $argv
end

function gcommit
    git commit -S -v $argv
end

function gcommitmsg
    git commit -S -m $argv
end

function gclone
    git clone $argv
end

function gclean
    git clean -id $argv
end

function gdiff
    git diff $argv
end

function gfetch
    git fetch $argv
end

function ghelp
    git help $argv
end

function gpull
    git pull $argv
end

function gmerge
    git merge $argv
end

function gpush
    git push $argv
end

function gremote
    git remote $argv
end

function grebase
    git rebase $argv
end

function grevert
    git revert $argv
end

function greset
    git reset $argv
end

function grm
    git rm $argv
end

function gremote
    git remote remove $argv
end

function grestore
    git restore $argv
end

function greset
    git reset -- $argv
end

function gshow
    git show $argv
end

function gstatus
    git status $argv
end

function gstash
    git stash $argv
end

function gall
    gpull && gadd . && gcommit -s && gpush
end
