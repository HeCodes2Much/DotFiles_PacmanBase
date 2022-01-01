function updaterepo
    while true
        read -l -P "Are you sure you want to update arch repo? [y/N] " confirm

        switch $confirm
            case Y y
                cd /mnt/500GB/.gitlabs/Arch.TheRepo.Club/
                ./git-v1.sh $argv
                cd $dirprev[1]
                echoResponce "Arch repo has been updated."
                return
            case "" N n
                return
        end
    end
end

function updatereadme
    while true
        read -l -P "Are you sure you want to update arch readme? [y/N] " confirm

        switch $confirm
            case Y y
                cd /mnt/500GB/.gitlabs/Arch.TheRepo.Club/docs/
                python updatereadme.py
                cd $dirprev[1]
                cd /mnt/500GB/.gitlabs/Arch.TheRepo.Club/x86_64/
                python updatereadme.py
                cd $dirprev[1]
                echoResponce "Arch readme has been updated."
                return
            case "" N n
                return
        end
    end
end

function echoResponce
    set_color 0F0
    echo -n "✔ "
    set_color FF0
    echo -n " $argv "
    set_color 0F0
    echo -e " ✔"
end
