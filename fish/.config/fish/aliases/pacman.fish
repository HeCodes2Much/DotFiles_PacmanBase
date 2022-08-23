# pacman functions
function pacman
    set red "\033[0;31m"
    set end "\033[0m"

    set num 1
    while test -f /var/lib/pacman/db.lck
        if test $num -eq 1
            printf "$red❯❯ Error$end: %s\n" "pacman is in use, will continue after operation."
            set num 2
        end
        sleep 2 &
        wait $last_pid
    end

    if [ "$argv" != -c ]
        command sudo pacman --color auto $argv
    else
        if pacman -Qttdq
            command sudo pacman -Qttdq | command sudo pacman -Rns -
        end
    end
end

# Update Repo
function update
    command pacman -Syu
end

function aurupdate
    command auracle update -C ~/.cache/pkgs/
end

function upall
    command pacman -Fy && pacman -Syu --noconfirm && aurupdate
end

#check aur and arch packages
function checkarch
    command pacman -Qqen >~/package_list.txt
end

function checkaur
    command pacman -Qqem >~/package_list_aur.txt
end

# Pacman unlock
function unlock
    command sudo rm /var/lib/pacman/db.lck
end
