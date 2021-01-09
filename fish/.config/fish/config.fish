function fish_greeting
#    bfetch --birthday 16/06
    fm6000 -f ~/.config/fm6000/art
end

# Check ports for current user
function ports
    sudo netstat -tulanp
end

#set permissions for user
function setperm
    sudo chown dt:dt $argv
end

#stow commands
function stowadd
    stow -St ~ $argv
end

function stowremove
    stow -Dt ~ $argv
end

#list comamnds
function l
    lsd $argv
end

function ls
    lsd $argv
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
    ls -A | egrep $argv
end

# Update Repo

function pacman
    command sudo pacman $argv
end

function update
    pacman -Syu
end

function instaupdate
    instaaur -c
end

function aurupdate
    auracle update -C ~/.cache/instaaur/pkg
end

#clear command
function clear
    command reset && fish
end

#pacman unlock
function unlock
    sudo rm /var/lib/pacman/db.lck
end

#free
function free
    command free -mt
end

#continue download
function wget
    command wget -c $argv
end

#grub update
function update-grub
    sudo grub-mkconfig -o /boot/grub/grub.cfg
end

#youtube-dl commands
function yta-aac
    youtube-dl --extract-audio --audio-format aac $argv
end

function yta-best
    youtube-dl --extract-audio --audio-format best $argv
end

function yta-m4a
    youtube-dl --extract-audio --audio-format m4a $argv
end

function yta-mp3
    youtube-dl --extract-audio --audio-format mp3 $argv
end

function yta-wav
    youtube-dl --extract-audio --audio-format wav $argv
end

#check aur and arch packages
function checkarch
    pacman -Qqen >~/package_list.txt
end

function checkaur
    pacman -Qqem >~/package_list_aur.txt
end

#rsync commands
function rsync-move
    rsync -avz --progress -h --remove-source-files $argv
end

function rsync-synchronize
    rsync -avzu --delete --progress -h $argv
end

function rsync-update
    rsync -avzu --progress -h $argv
end

function rsync-copy
    rsync -avz --progress -h $argv
end

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

function updaterepo
    while true
        read -l -P "Are you sure you want to update arch repo? [y/N] " confirm

        switch $confirm
            case Y y
                cd ~/.gitlabs/Arch.TheRepo.Club/
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
                cd ~/.gitlabs/Arch.TheRepo.Club/docs/
                python updatereadme.py
                cd $dirprev[1]
                cd ~/.gitlabs/Arch.TheRepo.Club/x86_64/
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

function package_count
    set red "\033[0;31m"
    set green "\033[0;32m"
    set blue "\033[0;34m"
    set end "\033[0m"

    printf "$red❯❯ Explicit$end: %s\n" (pacman -Qe | wc -l)
    printf "$green❯❯ Total$end: %s\n" (pacman -Q | wc -l)
    printf "$blue❯❯ External$end: %s\n" (pacman -Qm | wc -l)
end

# Keybinding
bind \ec __history_previous_command
bind \e\e __sudope
