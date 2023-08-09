from libqtile import widget
from libqtile.lazy import lazy
from os.path import expanduser
import subprocess

from colors import colorScheme, foregroundColor, backgroundColor


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
        filename=expanduser('~/.config/qtile/art/Archlinux-icon.svg'),
        margin=3,
        mouse_callbacks={'Button1': lazy.spawn('menu')},
    )

    power1 = widget.LaunchBar(
        text_only=True,
        foreground=colorScheme[1],
        progs=[
            ('⏻ ', 'rofi -show powermenu -config ~/.config/rofi/powermenu.rasi'),
        ],
    )

    power2 = widget.LaunchBar(
        text_only=True,
        foreground=colorScheme[1],
        progs=[
            ('⏻ ', 'rofi -show powermenu -config ~/.config/rofi/powermenu.rasi'),
        ],
    )

    groupBox1 = widget.GroupBox(
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
        use_mouse_wheel=True,
    )

    groupBox2 = widget.GroupBox(
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
        use_mouse_wheel=True,
    )

    windowName1 = widget.WindowName(
        foreground=backgroundColor,
        background=colorScheme[10],
        max_chars=42,
        padding=10,
    )

    windowName2 = widget.WindowName(
        foreground=backgroundColor,
        background=colorScheme[10],
        max_chars=42,
        padding=10,
    )

    volume = widget.Volume(
        fmt='Vol: {}',
        foreground=colorScheme[2],
        padding=10,
    )

    battery = widget.Battery(
        fmt='Bat: {}',
        foreground=colorScheme[3],
        padding=10,
        format='{char} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f} W',
    )

    backlight = widget.Backlight(
        fmt='Backlight: {}',
        foreground=colorScheme[4],
        padding=10,
        backlight_name="intel_backlight",
    )

    net = widget.Net(
        fmt='{}',
        foreground=colorScheme[5],
        padding=10,
        interface="wlp0s20f3",
    )

    date = widget.Clock(
        fmt='  {}',
        foreground=colorScheme[6],
        format='%d %B %Y',
        padding=10,
    )

    time = widget.Clock(
        fmt='  {}',
        foreground=colorScheme[6],
        format='%I:%M %p',
        padding=10,
    )

    tray = widget.Systray(
        fmt='{}',
        padding=5,
    )

    currentLayout1 = widget.CurrentLayoutIcon(
        fmt='{}',
        scale=0.7,
        padding=5,
    )

    currentLayout2 = widget.CurrentLayoutIcon(
        fmt='{}',
        scale=0.7,
        padding=5,
    )

    chords = widget.Chord(
        fmt='{}',
        chords_colors={
            "Resize Windows": (colorScheme[0], colorScheme[1]),
            "Launch Game": (colorScheme[0], colorScheme[2]),
            "Take a Screenshot": (colorScheme[0], colorScheme[3]),
        },
        name_transform=lambda name: name.upper(),
    )

    weather = widget.OpenWeather(
        fmt='{}',
        foreground=colorScheme[9],
        location='Darlington,UK',
        format='{location_city}: {main_temp}°{units_temperature} ',
    )

    updates = widget.CheckUpdates(
        fmt='{}',
        colour_have_updates=colorScheme[2],
        colour_no_updates=colorScheme[1],
        padding=10,
        distro='Arch_checkupdates',
        no_update_string='Fully Updated!',
        mouse_callbacks={
            'Button1': lazy.spawn('pkgbrowser'),
        },
    )

    picom = widget.GenPollText(
        fmt='{}',
        foreground=colorScheme[11],
        func=lambda: subprocess.check_output(expanduser("~/.config/qtile/scripts/picom.sh")).decode("utf-8"),
        mouse_callbacks={
            'Button1': lambda: subprocess.run(expanduser("~/.config/qtile/scripts/picom-toggle.sh")),
        },
        update_interval=1,
        padding=10,
    )

    github1 = widget.WidgetBox(
        foreground=colorScheme[12],
        widgets=[
            widget.GenPollText(
                fmt='{}',
                foreground=colorScheme[13],
                func=lambda: subprocess.check_output(expanduser("~/.config/qtile/scripts/github/notifications")).decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
            widget.GenPollText(
                fmt='{}',
                foreground=colorScheme[13],
                func=lambda: subprocess.check_output(expanduser("~/.config/qtile/scripts/github/gists")).decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
            widget.GenPollText(
                fmt='{}',
                foreground=colorScheme[13],
                func=lambda: subprocess.check_output(expanduser("~/.config/qtile/scripts/github/repositories")).decode("utf-8"),
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
                foreground=colorScheme[13],
                func=lambda: subprocess.check_output(expanduser("~/.config/qtile/scripts/github/notifications")).decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
            widget.GenPollText(
                fmt='{}',
                foreground=colorScheme[13],
                func=lambda: subprocess.check_output(expanduser("~/.config/qtile/scripts/github/gists")).decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
            widget.GenPollText(
                fmt='{}',
                foreground=colorScheme[13],
                func=lambda: subprocess.check_output(expanduser("~/.config/qtile/scripts/github/repositories")).decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
        ],
        text_closed='[Github <]',
        text_open='[Github >]',
    )