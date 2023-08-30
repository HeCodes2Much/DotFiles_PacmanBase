from libqtile import widget
from libqtile.lazy import lazy
from os.path import expanduser
import subprocess

from ext.multiColorTag import MultiColorTag

from colors import colorScheme, widgetColors, foregroundColor, backgroundColor


class Widgets(object):
    sep = widget.Sep(
        linewidth=0,
        padding=10,
        foreground=colorScheme[15],
        background=colorScheme[0],
    )

    space = widget.Spacer()

    launcher = widget.LaunchBar(
        text_only=True,
        fontsize=18,
        foreground=colorScheme[0],
        background=colorScheme[2],
        progs=[
            (" 󰣇 ", "menu"),
        ],
    )

    power = widget.LaunchBar(
        text_only=True,
        foreground=colorScheme[0],
        background=colorScheme[1],
        progs=[
            (" ⏻ ", "rofi -show powermenu -config ~/.config/rofi/powermenu.rasi"),
        ],
    )

    groupBox1 = MultiColorTag(
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
        tag_colors=widgetColors,
        this_current_screen_border=widgetColors,
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

    groupBox2 = MultiColorTag(
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
        tag_colors=widgetColors,
        this_current_screen_border=widgetColors,
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

    windowName = widget.WindowName(
        foreground=backgroundColor,
        background=colorScheme[10],
        max_chars=42,
        padding=10,
    )

    volume = widget.Volume(
        fmt=": {}",
        foreground=backgroundColor,
        background=colorScheme[2],
        padding=10,
    )

    backlight = widget.Backlight(
        fmt="󰞏 {}",
        foreground=backgroundColor,
        background=colorScheme[4],
        padding=10,
        backlight_name="intel_backlight",
    )

    net = widget.Net(
        fmt="󰛳 {}",
        format="{down} ↓↑ {up}",
        foreground=backgroundColor,
        background=colorScheme[5],
        padding=10,
        interface="wlan0",
    )

    date = widget.Clock(
        fmt="  {}",
        foreground=backgroundColor,
        background=colorScheme[6],
        format="%d %B %Y",
        padding=10,
    )

    time = widget.Clock(
        fmt="  {}",
        foreground=backgroundColor,
        background=colorScheme[6],
        format="%I:%M %p",
        padding=10,
    )

    tray = widget.Systray(
        fmt="{}",
        padding=7,
    )

    currentLayout = widget.CurrentLayoutIcon(
        fmt="{}",
        background=colorScheme[0],
        scale=0.7,
        padding=5,
    )

    chords = widget.Chord(
        fmt=" {} ",
        chords_colors={
            "Resize Windows": (colorScheme[1], backgroundColor),
            "Launch Game": (colorScheme[2], backgroundColor),
            "Take a Screenshot": (colorScheme[3], backgroundColor),
        },
        name_transform=lambda name: name.upper(),
    )

    weather = widget.OpenWeather(
        fmt=" 󰖕 {}",
        foreground=backgroundColor,
        background=colorScheme[9],
        location="Darlington,UK",
        format="{location_city}: {main_temp}°{units_temperature} ",
    )

    updates = widget.CheckUpdates(
        fmt="{}",
        colour_have_updates=colorScheme[2],
        colour_no_updates=colorScheme[1],
        padding=10,
        distro="Arch_checkupdates",
        no_update_string="Fully Updated!",
        mouse_callbacks={
            "Button1": lazy.spawn("pkgbrowser"),
        },
    )

    xcompmgr = widget.GenPollText(
        fmt="{}",
        foreground=backgroundColor,
        background=colorScheme[11],
        func=lambda: subprocess.check_output(
            expanduser("~/.config/qtile/scripts/xcompmgr.sh")
        ).decode("utf-8"),
        mouse_callbacks={
            "Button1": lambda: subprocess.run(
                expanduser("~/.config/qtile/scripts/xcompmgr-toggle.sh")
            ),
        },
        update_interval=1,
        padding=10,
    )

    github = widget.WidgetBox(
        foreground=backgroundColor,
        background=colorScheme[12],
        widgets=[
            widget.GenPollText(
                fmt="{}",
                foreground=backgroundColor,
                background=colorScheme[13],
                func=lambda: subprocess.check_output(
                    expanduser("~/.config/qtile/scripts/github/notifications")
                ).decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
            widget.GenPollText(
                fmt="{}",
                foreground=backgroundColor,
                background=colorScheme[13],
                func=lambda: subprocess.check_output(
                    expanduser("~/.config/qtile/scripts/github/gists")
                ).decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
            widget.GenPollText(
                fmt="{}",
                foreground=backgroundColor,
                background=colorScheme[13],
                func=lambda: subprocess.check_output(
                    expanduser("~/.config/qtile/scripts/github/repositories")
                ).decode("utf-8"),
                update_interval=10,
                padding=10,
            ),
        ],
        text_closed=" [Github <] ",
        text_open=" [Github >] ",
    )
