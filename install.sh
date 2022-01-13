#!/usr/bin/env bash
##################################################################################################################
# Author 	: 	The-Repo-Club
# Website	:	https://github.com/The-Repo-Club/
##################################################################################################################
#
#   DO NOT JUST RUN THIS. EXAMINE AND JUDGE. RUN AT YOUR OWN RISK.
#
##################################################################################################################
sync_flag=
unsync_flag=

syncFolders() {
    folders=$(./localbin/.local/bin/getfolders)

    for folder in $folders; do
        stow -St ~ $folder && echo "$folder has been synced"
    done

    echo -e "\n"
    echo -e "################################################################"
    echo -e "###################    T H E   E N D      ######################"
    echo -e "################################################################"
}

unsyncFolders() {
    folders=$(getfolders)

    for folder in $folders; do
        stow -Dt ~ $folder && echo "$folder has been synced"
    done

    echo -e "\n"
    echo -e "################################################################"
    echo -e "###################    T H E   E N D      ######################"
    echo -e "################################################################"
}

while true; do
    case $1 in
        -s|--sync)
            sync_flag=1
            shift
            ;;
        -u|--unsync)
            unsync_flag=1
            shift
            ;;
        *)
            break
            ;;
    esac
done

if [[ "$sync_flag" ]]; then
    syncFolders
elif [[ "$unsync_flag" ]]; then
    unsyncFolders
else
    echo "Help  with installing dotfiles."
    echo "./install.sh --sync - will sync all folders"
    echo "./install.sh --unsync - will unsync all folders"
fi
