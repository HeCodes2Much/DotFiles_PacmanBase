function fish_greeting
    bfetch --birthday 16/06
end

# Check ports for current user
function ports
    sudo netstat -tulanp
end

# Do a quick speedtest
function speedtest
    speedtest-cli --server 2406 --simple
end

#set permissions for user
function setperm --argument-names "filename"
    sudo chown dt:dt $filename
end

#list comamnds
function l --argument-names "filename"
    lsd $filename
end

function ls --argument-names "filename"
    lsd $filename
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

function lg --argument-names "filename"
    ls -A | egrep $filename
end

# Update Repo

function pacman
    command sudo pacman $argv
end

function update
    pacman -Syu
end

function yay-update
    yay -Syu
end

#clear command
function clear
    command clear && fish
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
function yta-aac --argument-names "filename"
    youtube-dl --extract-audio --audio-format aac $filename
end

function yta-best --argument-names "filename"
    youtube-dl --extract-audio --audio-format best $filename
end

function yta-m4a --argument-names "filename"
    youtube-dl --extract-audio --audio-format m4a $filename
end

function yta-mp3 --argument-names "filename"
    youtube-dl --extract-audio --audio-format mp3 $filename
end

function yta-wav --argument-names "filename"
    youtube-dl --extract-audio --audio-format wav $filename
end

#check aur and arch packages
function checkarch
    pacman -Qqetn >~/package_list.txt
end

function checkaur
    pacman -Qqetm >~/package_list_aur.txt
end

#rsync commands
function rsync-move --argument-names "filename"
    rsync -avz --progress -h --remove-source-files $filename
end

function rsync-synchronize --argument-names "filename"
    rsync -avzu --delete --progress -h $filename
end

function rsync-update --argument-names "filename"
    rsync -avzu --progress -h $filename
end

function rsync-copy --argument-names "filename"
    rsync -avz --progress -h $filename
end

#github commands
function g --argument-names "git"
    git $git
end

function gadd --argument-names "git"
    git add $git
end

function gbranch --argument-names "git"
    git branch $git
end

function gcommit --argument-names "git"
    git commit -S -v $git
end

function gcommitmsg --argument-names "git"
    git commit -S -m $git
end

function gclone --argument-names "git"
    git clone $git
end

function gclean --argument-names "git"
    git clean -id $git
end

function gdiff --argument-names "git"
    git diff $git
end

function gfetch --argument-names "git"
    git fetch $git
end

function ghelp --argument-names "git"
    git help $git
end

function gpull --argument-names "git"
    git pull $git
end


function gmerge --argument-names "git"
    git merge $git
end

function gpush --argument-names "git"
    git push $git
end

function gremote --argument-names "git"
    git remote $git
end

function grebase --argument-names "git"
    git rebase $git
end

function grevert --argument-names "git"
    git revert $git
end

function greset --argument-names "git"
    git reset $git
end

function grm --argument-names "git"
    git rm $git
end

function gremote --argument-names "git"
    git remote remove $git
end

function grestore --argument-names "git"
    git restore $git
end

function greset --argument-names "git"
    git reset -- $git
end

function gshow --argument-names "git"
    git show $git
end

function gstatus --argument-names "git"
    git status $git
end

function gstash --argument-names "git"
    git stash $git
end

function updaterepo --argument-names "type"
    while true
        read -l -P "Are you sure you want to update arch repo? [y/N] " confirm

        switch $confirm
            case Y y
                cd ~/.gitlabs/Arch.TheRepo.Club/
                ./git-v1.sh $type
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

# Keybinding
bind \ec __history_previous_command
bind \e\e __sudope
