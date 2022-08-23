#-*-coding:utf-8 -*-
xset b off
setxkbmap -layout gb
setxkbmap -option caps:super

set -gx LC_ALL "en_GB.UTF-8"
set -gx PAGER "most"
set -gx AUR_PAGER "most"
set -gx EDITOR "nvim-qt"
set -gx GIT_TOKEN "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"
#QT and GTK Variables
set -gx QT_QPA_PLATFORMTHEME "qt5ct"
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 0
set -gx TDESKTOP_USE_GTK_FILE_DIALOG 1

set -gx GOPATH $HOME/.cache/go
