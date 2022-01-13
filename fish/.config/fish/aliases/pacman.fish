# pacman functions
function pacman
    if [ "$argv" != "-c" ]
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

function upall
    pacman -Fy && pacman -Syu --noconfirm
end

#check aur and arch packages
function checkarch
    pacman -Qqen >~/package_list.txt
end

function checkaur
    pacman -Qqem >~/package_list_aur.txt
end

function aurupdate
    auracle update -C ~/.cache/pkg/
end

# Pacman unlock
function unlock
    sudo rm /var/lib/pacman/db.lck
end
