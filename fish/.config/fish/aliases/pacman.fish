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
            pacman -Qttdq | pacman -Rns -
        end
    end
end

# Update Repo
function update
    pacman -Syu
end

function aurupdate
    auracle update -C ~/.cache/pkgs/
end

function upall
    pacman -Fy && pacman -Syu --noconfirm && aurupdate
end

#check aur and arch packages
function checkarch
    pacman -Qqen >~/package_list.txt
end

function checkaur
    pacman -Qqem >~/package_list_aur.txt
end

# Pacman unlock
function unlock
    sudo rm /var/lib/pacman/db.lck
end
