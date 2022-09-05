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

    if [ "$argv" = -c ]
        if pacman -Qttdq
            command sudo pacman --color auto -Qttdq | command sudo pacman --color auto -Rns -
        end
    else if [ "$argv" = --upall ]
        command sudo pacman -Fy
        command sudo pacman -Sy
        command sudo pacman -Su --noconfirm
        command auracle update -C ~/.cache/pkgs/
    else if [ "$argv" = --pacsync ]
        command pacsync
    else
        command sudo pacman --color auto $argv
    end
end

# Update all repos
function upall
    pacman --upall
end

#check aur and arch packages
function checkarch
    command sudo pacman -Qqen >~/package_list.txt
end

function checkaur
    command sudo pacman -Qqem >~/package_list_aur.txt
end

# Pacman unlock
function unlock
    command sudo rm /var/lib/pacman/db.lck
end
