#-*-coding:utf-8 -*-
xset b off
setxkbmap -layout gb
setxkbmap -option caps:super

set -gx LC_ALL "en_GB.UTF-8"
set -gx ANDROID_HOME "/home/repo/Android/Sdk"
set -gx PAGER more
set -gx AUR_PAGER more
set -gx EDITOR vim
#QT and GTK Variables
set -gx QT_QPA_PLATFORMTHEME qt5ct
set -gx QT_AUTO_SCREEN_SCALE_FACTOR 0
set -gx TDESKTOP_USE_GTK_FILE_DIALOG 1

set -gx GOPATH $HOME/.cache/go
