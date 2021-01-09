#!/usr/bin/bash
EDITOR='code'

## Reset Colors
Reset='\e[38;5;15m'
### Custom colors
Magenta='\e[38;5;90m'
Rrange='\e[38;5;214m'
Purple='\e[38;5;98m'
Yellow='\e[38;5;228m'
Green='\e[38;5;84m'
Blue='\e[38;5;75m'
Cyan='\e[38;5;50m'
Plum='\e[38;5;414m'
Red='\e[38;5;124m'
### Custom colors

### Functions
function editalias () {
    read -r "response?Are you sure you want to edit .bash_aliases? [Y/n] "
    sudo echo -e "${Magenta}$(whoami) ${Reset}has used the ${Cyan}editalias ${Reset}alias."
    response=${response:l} #tolower
    if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
        ${EDITOR} ~/.bash_aliases
        source ~/.zshrc
        echo -e "${Green} ✔ ${Yellow}bash_aliases edited and reloaded.${Green} ✔ ${Reset}"
    fi
    return
}

function trashput () {
    if [[ $1 != '' ]]; then
        read -r "response?Are you sure you want to trash $1? [Y/n] "
        sudo echo -e "${Magenta}$(whoami) ${Reset}has used a ${Cyan}trash-cli ${Reset}alias."
        response=${response:l} #tolower
        if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
            trash-put $1
            echo -e "${Green} ✔ ${Yellow}$1 has been sent to the trash.${Green} ✔ ${Reset}"
        fi
        return
    fi
    echo -e "${Red} ❌ ${Rrange}Please state what file you wanted to delete.${Red} ❌ ${Reset}"
}

function trashempty () {
    read -r "response?Are you sure you want to empty the trash? [Y/n] "
    sudo echo -e "${Magenta}$(whoami) ${Reset}has used a ${Cyan}trash-cli ${Reset}alias."
    response=${response:l} #tolower
    if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
        trash-empty
        echo -e "${Green} ✔ ${Yellow}Trash has been emptied.${Green} ✔ ${Reset}"
    fi
    return
}

function trashrestore () {
    if [[ $1 != '' ]]; then
        read -r "response?Are you sure you want to restore $1? [Y/n] "
        sudo echo -e "${Magenta}$(whoami) ${Reset}has used a ${Cyan}trash-cli ${Reset}alias."
        response=${response:l} #tolower
        if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
            trash-restore $1
            echo -e "${Green} ✔ ${Yellow}$1 has been restored from the trash.${Green} ✔ ${Reset}"
        fi
        return
    fi
    echo -e "${Red} ❌ ${Rrange}Please state what file you wanted to restore.${Red} ❌ ${Reset}"
}

function trashrm () {
    if [[ $1 != '' ]]; then
        read -r "response?Are you sure you want to remove $1? [Y/n] "
        sudo echo -e "${Magenta}$(whoami) ${Reset}has used a ${Cyan}trash-cli ${Reset}alias."
        response=${response:l} #tolower
        if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
            trash-rm $1
            echo -e "${Green} ✔ ${Yellow}$1 has been removed from the trash.${Green} ✔ ${Reset}"
        fi
        return
    fi
    echo -e "${Red} ❌ ${Rrange}Please state what file you wanted to remove.${Red} ❌ ${Reset}"
}

function updaterepo () {
    read -r "response?Are you sure you want to update cynicalteam arch repo? [Y/n] "
    sudo echo -e "${Magenta}$(whoami) ${Reset}has used the ${Cyan}updaterepo ${Reset}alias."
    response=${response:l} #tolower
    if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
        cd ~/.gitlabs/ArchRepo/x86_64/
        ./updaterepo.sh
        cd "$OLDPWD"
        echo -e "${Green} ✔ ${Yellow}cynicalteam arch repo has been updated.${Green} ✔ ${Reset}"
    fi
    return
}

function updatereadme () {
    read -r "response?Are you sure you want to update cynicalteam arch repo? [Y/n] "
    sudo echo -e "${Magenta}$(whoami) ${Reset}has used the ${Cyan}updaterepo ${Reset}alias."
    response=${response:l} #tolower
    if [[ $response =~ ^(yes|y| ) ]] || [[ -z $response ]]; then
        cd ~/.gitlabs/ArchRepo/docs/
        python updatereadme.py
        cd "$OLDPWD"
        cd ~/.gitlabs/ArchRepo/x86_64/
        python updatereadme.py
        cd "$OLDPWD"
        echo -e "${Green} ✔ ${Yellow}cynicalteam arch repo has been updated.${Green} ✔ ${Reset}"
    fi
    return
}

### Functions

## Commands
# Edit this file
alias ea='editalias'

# Check ports for current user
alias ports='sudo netstat -tulanp'

# Do a quick speedtest
alias speedtest='speedtest-cli --server 2406 --simple'

# vim
alias vim='termite --title=vim --class=vim --name=vim -e vim'

# Minecraft commands
alias runmc='~/Documents/minecraft/launch.sh'

# Update Repo
alias updaterepo='updaterepo'
alias updatereadme='updatereadme'

###Permissions
alias setperm='sudo chown dt:dt'

###Trash
alias tp='trashput'
alias te='trashempty'
alias tl='trash-list'
alias trs='trashrestore'
alias trm='trashrm'


#list
alias l='lsd'
alias ls='lsd'
alias la='ls -a'
alias ll='ls -l'
alias lla='ls -la'
alias lt='ls --tree'
alias l.="ls -A | egrep '^\.'"

#fix obvious typo's
alias cd..='cd ..'
alias pdw="pwd"
alias udpate='sudo pacman -Syyu'
alias upate='sudo pacman -Syyu'

## Colorize the grep command output for ease of use (good for log files)##
alias grep='grep --color=auto'
alias egrep='egrep --color=auto'
alias fgrep='fgrep --color=auto'

#readable output
alias df='df -h'

#pacman unlock
alias unlock="sudo rm /var/lib/pacman/db.lck"

#free
alias free="free -mt"

#use all cores
alias uac="sh ~/.bin/main/000*"

#continue download
alias wget="wget -c"

#userlist
alias userlist="cut -d: -f1 /etc/passwd"

#merge new settings
alias merge="xrdb -merge ~/.Xresources"

# Aliases for software managment
# pacman or pm
alias pacman='sudo pacman --color auto'
alias update='sudo pacman -Syyu'

# yay as aur helper - updates everything
alias pksyua="yay -Syu --noconfirm"
alias upall="yay -Syu --noconfirm"

#ps
alias psa="ps auxf"
alias psgrep="ps aux | grep -v grep | grep -i -e VSZ -e"

#grub update
alias update-grub="sudo grub-mkconfig -o /boot/grub/grub.cfg"

#add new fonts
alias update-fc='sudo fc-cache -fv'

#switch between bash and fish
alias tobash="sudo chsh $USER -s /bin/bash && echo 'Now log out.'"
alias tofish="sudo chsh $USER -s /bin/fish && echo 'Now log out.'"

#quickly kill conkies
alias kc='killall conky'

#hardware info --short
alias hw="hwinfo --short"

#skip integrity check
alias yayskip='yay -S --mflags --skipinteg'

#check vulnerabilities microcode
alias microcode='grep . /sys/devices/system/cpu/vulnerabilities/*'


#mounting the folder Public for exchange between host and guest on virtualbox
alias vbm="sudo mount -t vboxsf -o rw,uid=1000,gid=1000 Public /home/$USER/Public"

#youtube-dl
alias yta-aac="youtube-dl --extract-audio --audio-format aac "
alias yta-best="youtube-dl --extract-audio --audio-format best "
alias yta-flac="youtube-dl --extract-audio --audio-format flac "
alias yta-m4a="youtube-dl --extract-audio --audio-format m4a "
alias yta-mp3="youtube-dl --extract-audio --audio-format mp3 "
alias yta-opus="youtube-dl --extract-audio --audio-format opus "
alias yta-vorbis="youtube-dl --extract-audio --audio-format vorbis "
alias yta-wav="youtube-dl --extract-audio --audio-format wav "

alias ytv-best="youtube-dl -f bestvideo+bestaudio "

#Recent Installed Packages
alias rip="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -200 | nl"
alias riplong="expac --timefmt='%Y-%m-%d %T' '%l\t%n %v' | sort | tail -3000 | nl"

#Cleanup orphaned packages
alias cleanup='sudo pacman -Rns $(pacman -Qtdq)'

#get the error messages from journalctl
alias jctl="journalctl -p 3 -xb"

#nano for important configration files
#know what you do in these files
alias npacman="sudo nano /etc/pacman.conf"
alias ngrub="sudo nano /etc/default/grub"
alias nmirrorlist="sudo nano /etc/pacman.d/mirrorlist"
alias nconfgrub="sudo nano /boot/grub/grub.cfg"

#gpg
#verify signature for isos
alias gpg-check="gpg2 --keyserver-options auto-key-retrieve --verify"
#receive the key of a developer
alias gpg-retrieve="gpg2 --keyserver-options auto-key-retrieve --receive-keys"

#shutdown or reboot
alias ssn="sudo shutdown now"
alias sr="sudo reboot"

#clear then run cynfetch
alias clear="clear && bash"

#check aur and arch packages
alias checkarch="pacman -Qqetn > package_list.txt"
alias checkaur="pacman -Qqetm > package_list_aur.txt"

###Github
alias g='git'

alias ga='git add'
alias gaa='git add --all'
alias gapa='git add --patch'
alias gau='git add --update'
alias gav='git add --verbose'
alias gap='git apply'
alias gapt='git apply --3way'

alias gb='git branch'
alias gba='git branch -a'
alias gbd='git branch -d'
alias gbda='git branch --no-color --merged | command grep -vE "^(\+|\*|\s*($(git_main_branch)|development|develop|devel|dev)\s*$)" | command xargs -n 1 git branch -d'
alias gbD='git branch -D'
alias gbl='git blame -b -w'
alias gbnm='git branch --no-merged'
alias gbr='git branch --remote'
alias gbs='git bisect'
alias gbsb='git bisect bad'
alias gbsg='git bisect good'
alias gbsr='git bisect reset'
alias gbss='git bisect start'

alias gc='git commit -v'
alias gc!='git commit -v --amend'
alias gcn!='git commit -v --no-edit --amend'
alias gca='git commit -v -a'
alias gca!='git commit -v -a --amend'
alias gcan!='git commit -v -a --no-edit --amend'
alias gcans!='git commit -v -a -s --no-edit --amend'
alias gcam='git commit -a -m'
alias gcsm='git commit -s -m'
alias gcb='git checkout -b'
alias gcf='git config --list'
alias gcl='git clone --recurse-submodules'
alias gclean='git clean -id'
alias gpristine='git reset --hard && git clean -dffx'
alias gcm='git checkout $(git_main_branch)'
alias gcd='git checkout develop'
alias gcmsg='git commit -m'
alias gco='git checkout'
alias gcount='git shortlog -sn'
alias gcp='git cherry-pick'
alias gcpa='git cherry-pick --abort'
alias gcpc='git cherry-pick --continue'
alias gcs='git commit -S'

alias gd='git diff'
alias gdca='git diff --cached'
alias gdcw='git diff --cached --word-diff'
alias gdct='git describe --tags $(git rev-list --tags --max-count=1)'
alias gds='git diff --staged'
alias gdt='git diff-tree --no-commit-id --name-only -r'
alias gdw='git diff --word-diff'

alias gf='git fetch'
alias gfa='git fetch --all --prune'
alias gfo='git fetch origin'
alias gfg='git ls-files | grep'

alias gg='git gui citool'
alias gga='git gui citool --amend'

alias ggpur='ggu'
alias ggpull='git pull origin "$(git_current_branch)"'
alias ggpush='git push origin "$(git_current_branch)"'

alias ggsup='git branch --set-upstream-to=origin/$(git_current_branch)'
alias gpsup='git push --set-upstream origin $(git_current_branch)'

alias ghh='git help'

alias gignore='git update-index --assume-unchanged'
alias gignored='git ls-files -v | grep "^[[:lower:]]"'
alias git-svn-dcommit-push='git svn dcommit && git push github $(git_main_branch):svntrunk'

alias gk='\gitk --all --branches'
alias gke='\gitk --all $(git log -g --pretty=%h)'

alias gl='git pull'
alias glg='git log --stat'
alias glgp='git log --stat -p'
alias glgg='git log --graph'
alias glgga='git log --graph --decorate --all'
alias glgm='git log --graph --max-count=10'
alias glo='git log --oneline --decorate'
alias glol="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset'"
alias glols="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --stat"
alias glod="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset'"
alias glods="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%ad) %C(bold blue)<%an>%Creset' --date=short"
alias glola="git log --graph --pretty='%Cred%h%Creset -%C(auto)%d%Creset %s %Cgreen(%cr) %C(bold blue)<%an>%Creset' --all"
alias glog='git log --oneline --decorate --graph'
alias gloga='git log --oneline --decorate --graph --all'
alias glp="_git_log_prettily"

alias gm='git merge'
alias gmom='git merge origin/$(git_main_branch)'
alias gmt='git mergetool --no-prompt'
alias gmtvim='git mergetool --no-prompt --tool=vimdiff'
alias gmum='git merge upstream/$(git_main_branch)'
alias gma='git merge --abort'

alias gp='git push'
alias gpd='git push --dry-run'
alias gpf='git push --force-with-lease'
alias gpf!='git push --force'
alias gpoat='git push origin --all && git push origin --tags'
alias gpu='git push upstream'
alias gpv='git push -v'

alias gr='git remote'
alias gra='git remote add'
alias grb='git rebase'
alias grba='git rebase --abort'
alias grbc='git rebase --continue'
alias grbd='git rebase develop'
alias grbi='git rebase -i'
alias grbm='git rebase $(git_main_branch)'
alias grbs='git rebase --skip'
alias grev='git revert'
alias grh='git reset'
alias grhh='git reset --hard'
alias groh='git reset origin/$(git_current_branch) --hard'
alias grm='git rm'
alias grmc='git rm --cached'
alias grmv='git remote rename'
alias grrm='git remote remove'
alias grs='git restore'
alias grset='git remote set-url'
alias grss='git restore --source'
alias grt='cd "$(git rev-parse --show-toplevel || echo .)"'
alias gru='git reset --'
alias grup='git remote update'
alias grv='git remote -v'

alias gsb='git status -sb'
alias gsd='git svn dcommit'
alias gsh='git show'
alias gsi='git submodule init'
alias gsps='git show --pretty=short --show-signature'
alias gsr='git svn rebase'
alias gss='git status -s'
alias gst='git status'

alias gsta='git stash push'
alias gstaa='git stash apply'
alias gstc='git stash clear'
alias gstd='git stash drop'
alias gstl='git stash list'
alias gstp='git stash pop'
alias gsts='git stash show --text'
alias gstu='git stash --include-untracked'
alias gstall='git stash --all'
alias gsu='git submodule update'
alias gsw='git switch'
alias gswc='git switch -c'

alias gts='git tag -s'
alias gtv='git tag | sort -V'
alias gtl='gtl(){ git tag --sort=-v:refname -n -l "${1}*" }; noglob gtl'

alias gunignore='git update-index --no-assume-unchanged'
alias gunwip='git log -n 1 | grep -q -c "\-\-wip\-\-" && git reset HEAD~1'
alias gup='git pull --rebase'
alias gupv='git pull --rebase -v'
alias gupa='git pull --rebase --autostash'
alias gupav='git pull --rebase --autostash -v'
alias glum='git pull upstream $(git_main_branch)'

alias gwch='git whatchanged -p --abbrev-commit --pretty=medium'
alias gwip='git add -A; git rm $(git ls-files --deleted) 2> /dev/null; git commit --no-verify --no-gpg-sign -m "--wip-- [skip ci]"'

alias gam='git am'
alias gamc='git am --continue'
alias gams='git am --skip'
alias gama='git am --abort'
alias gamscp='git am --show-current-patch'

###Rsync
alias rsync-copy="rsync -avz --progress -h"
alias rsync-move="rsync -avz --progress -h --remove-source-files"
alias rsync-update="rsync -avzu --progress -h"
alias rsync-synchronize="rsync -avzu --delete --progress -h"