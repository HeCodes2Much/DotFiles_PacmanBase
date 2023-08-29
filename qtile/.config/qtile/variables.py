class Variables(object):
    ALT = "mod1"
    MOD = "mod4"
    CTRL = "control"
    SHIFT = "shift"


class Commands(object):
    editor = "code"
    menu = "menu"
    browser = "firefox"
    terminal = "alacritty"
    btop = "kitty --class=btop -e btop"
    powermenu = "rofi -show powermenu -config ~/.config/rofi/powermenu.rasi"
    vbox = "virt-manager"
    files = "nemo"
    mail = "thunderbird"
    passmenu = "passmenu"

    autostart = ["autostart"]
    configure = [
        "youtube_subs -d",
        "autorandr --load qtile",
        "setxkbmap -option caps:escape",
    ]
