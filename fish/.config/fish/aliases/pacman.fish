# Update Repo

function pacman
    command sudo pacman $argv
end

function yay
    command yay --color auto $argv
end

function update
    pacman -Syu
end

function upall
    yay -Fy && yay -Syu --noconfirm
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
