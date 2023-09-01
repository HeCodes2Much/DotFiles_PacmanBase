from libqtile.bar import CALCULATED
from libqtile.lazy import lazy

from core.bar.base import base, icon_font, powerline, rectangle
from extras import Clock, GroupBox, TextBox, modify, widget
from utils.config import cfg
from utils.palette import palette

bar = {
    "background": palette.backgroundColor,
    "border_color": palette.backgroundColor,
    "border_width": 2,
    "margin": 2,
    "opacity": 1,
    "size": 18,
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


def widgets():
    return [
        widget.Spacer(length=2),
        *weather(palette.colorScheme[1], palette.currentColor),
        widget.Spacer(),
        widget.Spacer(length=2),
    ]
