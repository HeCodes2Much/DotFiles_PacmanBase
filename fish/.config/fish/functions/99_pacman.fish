# pacman functions
function pacman
    set yellow "\033[0;33m"
    set end "\033[0m"

    set num 1
    while test -f /var/lib/pacman/db.lck
        if test $num -eq 1
            printf "$yellow->$end %s\n" "/var/lib/pacman/db.lck is present."
            printf "$yellow->$end %s\n" "There may be another Pacman instance running. Waiting..."
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
        sudo pkgfile -u
        yay -Fy
        yay -Syu
    else if [ "$argv" = --pacsync ]
        pacsync
    else
        command sudo pacman --color auto $argv
    end
end

# Update all packages
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
    sudo rm /var/lib/pacman/db.lck
end
