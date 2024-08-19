# arch repo commands

function updaterepo
    while true
        read -l -P "Are you sure you want to update arch repo? [y/N] " confirm

        switch $confirm
            case Y y
                cd /run/media/wayne/Backup/.gitlabs/ArchLinux.Repo.063240.xyz/scripts/
                python mkindex.py --header "arch.linuxrepos.org" ../x86_64 >../x86_64/index.html
                cd /run/media/wayne/Backup/.gitlabs/ArchLinux.Repo.063240.xyz/
                ./x86_64/updaterepo.sh $argv
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
                cd /run/media/wayne/Backup/.gitlabs/ArchLinux.Repo.063240.xyz/scripts/
                python updatereadme.py
                cd $dirprev[1]
                cd /run/media/wayne/Backup/.gitlabs/ArchLinux.Repo.063240.xyz/x86_64/
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
