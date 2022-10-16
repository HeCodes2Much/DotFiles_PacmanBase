from colors import colorScheme, foregroundColor, backgroundColor
from libqtile import widget
from libqtile.lazy import lazy
import subprocess


class Widgets(object):

    sep = widget.Sep(
        linewidth=1,
        padding=10,
        foreground=colorScheme[15],
        background=colorScheme[0],
    )

    space = widget.Spacer()

    launcher = widget.Image(
        fmt='{}',
        filename='~/.config/qtile/art/Archlinux-icon.svg',
        margin=3,
        mouse_callbacks={'Button1': lazy.spawn('repomenu_desktop --repomenu="repomenu -h 50 -i -l 15 -w 500 -y 32 -x 5 -p Launcher -q Search..."')},
    )

    power1 = widget.LaunchBar(
        text_only=True,
        foreground=colorScheme[1],
        progs=[
            ('⏻ ', 'repomenue_powermenu', 'launch repomenu powermenu'),
        ],
    )

    power2 = widget.LaunchBar(
        text_only=True,
        foreground=colorScheme[1],
        progs=[
            ('⏻ ', 'repomenue_powermenu', 'launch repomenu powermenu'),
        ],
    )

    groupBox1 = widget.GroupBox(
        font="SauceCodePro Nerd Font",
        fontsize=16,
        margin_y=4,
        margin_x=4,
        padding_y=6,
        padding_x=6,
        borderwidth=2,
        disable_drag=True,
        active=colorScheme[6],
        inactive=foregroundColor,
        hide_unused=True,
        rounded=False,
        highlight_method="line",
        highlight_color=backgroundColor,
        this_current_screen_border=colorScheme[2],
        this_screen_border=colorScheme[1],
        other_screen_border=colorScheme[6],
        other_current_screen_border=colorScheme[6],
        urgent_alert_method="line",
        urgent_border=colorScheme[9],
        urgent_text=colorScheme[1],
        foreground=foregroundColor,
        background=backgroundColor,
        use_mouse_wheel=False,
        visible_groups=["1", "2", "3", "4", "5"],
    )

    groupBox2 = widget.GroupBox(
        font="SauceCodePro Nerd Font",
        fontsize=16,
        margin_y=4,
        margin_x=4,
        padding_y=6,
        padding_x=6,
        borderwidth=2,
        disable_drag=True,
        active=colorScheme[6],
        inactive=foregroundColor,
        hide_unused=True,
        rounded=False,
        highlight_method="line",
        highlight_color=backgroundColor,
        this_current_screen_border=colorScheme[2],
        this_screen_border=colorScheme[1],
        other_screen_border=colorScheme[6],
        other_current_screen_border=colorScheme[6],
        urgent_alert_method="line",
        urgent_border=colorScheme[9],
        urgent_text=colorScheme[1],
        foreground=foregroundColor,
        background=backgroundColor,
        use_mouse_wheel=False,
        visible_groups=["6", "7", "8", "9", "0"],
    )

    windowName1 = widget.WindowName(
        font="SauceCodePro Nerd Font",
        foreground=backgroundColor,
        background=colorScheme[10],
        padding=10,
    )

    windowName2 = widget.WindowName(
        font="SauceCodePro Nerd Font",
        foreground=backgroundColor,
        background=colorScheme[10],
        padding=10,
    )

    volume = widget.Volume(
        fmt='Vol: {}',
        padding=10,
    )

    battery = widget.Battery(
        fmt='Bat: {}',
        padding=10,
        format='{char} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f} W',
    )

    backlight = widget.Backlight(
        fmt='Backlight: {}',
        padding=10,
        backlight_name="intel_backlight",
    )

    net = widget.Net(
        fmt='{}',
        padding=10,
        interface="wlp0s20f3",
    )

    date = widget.Clock(
        fmt='  {}',
        format='%d %B %Y',
        padding=10,
        font="SauceCodePro Nerd Font",
        foreground=colorScheme[15],
    )

    time = widget.Clock(
        fmt='  {}',
        format='%I:%M %p',
        padding=10,
        font="SauceCodePro Nerd Font",
        foreground=colorScheme[15],
    )

    tray = widget.Systray(
        fmt='{}',
        padding=5,
    )

    currentLayout = widget.CurrentLayoutIcon(
        fmt='{}',
        scale=0.7,
        padding=5,
    )

    chords = widget.Chord(
        fmt='{}',
        chords_colors={
            "Resize Windows": (colorScheme[0], colorScheme[1]),
            "Launch Game": (colorScheme[0], colorScheme[2]),
        },
        name_transform=lambda name: name.upper(),
    )

    weather = widget.OpenWeather(
        fmt='{}',
        location='Darlington,UK',
        format='{location_city}: {main_temp}°{units_temperature} ',
    )

    updates = widget.CheckUpdates(
        fmt='{}',
        padding=10,
        distro='Arch_paru',
        no_update_string='No Updates!',
        mouse_callbacks={
            'Button1': lazy.spawn('pkgbrowser'),
        },
    )

    picom = widget.GenPollText(
        fmt='{}',
        func=lambda: subprocess.check_output("/home/repo/.config/qtile/scripts/picom.sh").decode("utf-8"),
        mouse_callbacks={
            'Button1': lambda: subprocess.run("/home/repo/.config/qtile/scripts/picom-toggle.sh"),
        },
        update_interval=1,
        padding=10,
    )

    github1 = widget.WidgetBox(
        widgets=[
            widget.GenPollText(
                fmt='{}',
                func=lambda: subprocess.check_output("/home/repo/.config/qtile/scripts/github/notifications").decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
            widget.GenPollText(
                fmt='{}',
                func=lambda: subprocess.check_output("/home/repo/.config/qtile/scripts/github/gists").decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
            widget.GenPollText(
                fmt='{}',
                func=lambda: subprocess.check_output("/home/repo/.config/qtile/scripts/github/repositories").decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
        ],
        text_closed='[Github <]',
        text_open='[Github >]',
    )

    github2 = widget.WidgetBox(
        widgets=[
            widget.GenPollText(
                fmt='{}',
                func=lambda: subprocess.check_output("/home/repo/.config/qtile/scripts/github/notifications").decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
            widget.GenPollText(
                fmt='{}',
                func=lambda: subprocess.check_output("/home/repo/.config/qtile/scripts/github/gists").decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
            widget.GenPollText(
                fmt='{}',
                func=lambda: subprocess.check_output("/home/repo/.config/qtile/scripts/github/repositories").decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
        ],
        text_closed='[Github <]',
        text_open='[Github >]',
    )