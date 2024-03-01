from core.bar.base import base, icon_font, powerline, rectangle
from extras import Clock, GroupBox, TextBox, modify, widget
from utils.config import cfg
from utils.palette import palette

from os.path import expanduser
import subprocess

bar = {
    "background": palette.backgroundColor,
    "border_color": palette.backgroundColor,
    "border_width": 2,
    "margin": 5,
    "opacity": 1,
    "size": 24,
}


def sep(fg, offset=0, padding=8) -> TextBox:
    return TextBox(
        **base(None, fg),
        **icon_font(),
        offset=offset,
        padding=padding,
        text="󰇙",
    )


def weather(bg, fg) -> list:
    return [
        modify(
            TextBox,
            **base(bg, fg),
            **icon_font(),
            **rectangle("left"),
            offset=0,
            padding=0,
        ),
        widget.OpenWeather(
            **base(bg, fg),
            fmt="{}",
            location="Darlington,UK",
            format="{icon} {location_city}: {main_temp}°{units_temperature}",
        ),
        modify(
            TextBox,
            **base(bg, fg),
            **icon_font(),
            **rectangle("right"),
            offset=0,
            padding=0,
        ),
    ]


def chords(bg, fg) -> list:
    return [
        widget.Chord(
            **base(bg, fg),
            fmt="{}",
            chords_colors={
                "Resize Windows": (fg, bg),
                "Launch Game": (fg, bg),
                "Take a Screenshot": (fg, bg),
            },
            name_transform=lambda name: name.upper(),
        ),
    ]


def picom(bg, fg) -> list:
    return [
        modify(
            TextBox,
            **base(bg, fg),
            **icon_font(),
            **rectangle("left"),
            offset=0,
            padding=0,
        ),
        widget.GenPollText(
            **base(bg, fg),
            fmt="{}",
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
        ),
        modify(
            TextBox,
            **base(bg, fg),
            **icon_font(),
            **rectangle("right"),
            offset=0,
            padding=0,
        ),
    ]


def widgets():
    return [
        widget.Spacer(length=2),
        *weather(palette.colorScheme[1], palette.currentColor),
        widget.Spacer(),
        *chords(palette.colorScheme[2], palette.currentColor),
        *picom(palette.colorScheme[3], palette.currentColor),
        widget.Spacer(length=2),
    ]
