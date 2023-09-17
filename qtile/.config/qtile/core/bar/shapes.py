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


def menu(bg, fg) -> TextBox:
    return modify(
        TextBox,
        **base(bg, fg),
        **icon_font(),
        **rectangle(),
        mouse_callbacks={"Button1": lazy.spawn(cfg.menu)},
        offset=4,
        padding=7,
        text="󰍜",
    )


def groups(bg) -> GroupBox:
    return GroupBox(
        **icon_font(),
        background=bg,
        borderwidth=2,
        colors=palette.widgetColors,
        highlight_color=palette.currentColor,
        highlight_method="line",
        inactive=palette.foregroundColor,
        invert=True,
        margin_y=4,
        margin_x=4,
        padding_y=6,
        padding_x=6,
        rainbow=True,
        hide_unused=True,
        use_mouse_wheel=True,
    )


def volume(bg, fg) -> list:
    return [
        modify(
            TextBox,
            **base(bg, fg),
            **icon_font(),
            **rectangle("left"),
            text="󰖀",
            x=4,
        ),
        widget.Volume(
            **base(bg, fg),
            **powerline("arrow_left"),
            check_mute_command="pamixer --get-mute",
            check_mute_string="true",
            get_volume_command="pamixer --get-volume-human",
            mute_command="pamixer --toggle-mute",
            update_interval=0.1,
            volume_down_command="pamixer --decrease 5",
            volume_up_command="pamixer --increase 5",
        ),
    ]


def backlight(bg, fg) -> list:
    return [
        modify(
            TextBox,
            **base(bg, fg),
            **icon_font(),
            **powerline("arrow_left"),
            text="󰃟",
            x=4,
        ),
        widget.Backlight(
            **base(bg, fg),
            **powerline("arrow_left"),
            step=5,
            backlight_name="intel_backlight",
            change_command="brightnessctl set {}%",
        ),
    ]


def updates(bg, fg) -> list:
    return [
        TextBox(
            **base(bg, fg),
            **icon_font(),
            offset=-1,
            text="",
            x=-5,
        ),
        widget.CheckUpdates(
            **base(bg, fg),
            **rectangle("right"),
            mouse_callbacks={"Button1": lazy.spawn(cfg.term + " -e yay -Syu")},
            colour_have_updates=fg,
            colour_no_updates=fg,
            display_format="{updates} updates  ",
            distro="Arch_checkupdates",
            initial_text="No updates  ",
            no_update_string="No updates  ",
            padding=0,
            update_interval=3600,
        ),
    ]


def power(bg, fg) -> TextBox:
    return modify(
        TextBox,
        **base(bg, fg),
        **icon_font(),
        **rectangle(),
        mouse_callbacks={
            "Button1": lazy.spawn(cfg.power),
            "Button3": lazy.spawn("qtile cmd-obj -o cmd -f restart"),
        },
        offset=4,
        padding=7,
        text="",
    )


def window_name(bg, fg) -> object:
    return widget.WindowName(
        **base(bg, fg),
        format="{name}",
        max_chars=60,
        width=CALCULATED,
    )


def cpu(bg, fg) -> list:
    return [
        TextBox(
            **base(bg, fg),
            **icon_font(),
            **rectangle("left"),
            offset=3,
            text="󰍛",
            x=5,
        ),
        widget.CPU(
            **base(bg, fg),
            **powerline("arrow_left"),
            format="{load_percent:.0f}%",
        ),
    ]


def ram(bg, fg) -> list:
    return [
        TextBox(
            **base(bg, fg),
            **icon_font(),
            offset=-2,
            padding=5,
            text="󰘚",
            x=-2,
        ),
        widget.Memory(
            **base(bg, fg),
            **powerline("arrow_right"),
            format="{MemUsed: .0f}{mm}/{SwapUsed: .0f}{ms} ",
            padding=-1,
        ),
    ]


def disk(bg, fg) -> list:
    return [
        TextBox(
            **base(bg, fg),
            **icon_font(),
            offset=-1,
            text="",
            x=-5,
        ),
        widget.DF(
            **base(bg, fg),
            **rectangle("right"),
            format="{f} GB  ",
            padding=0,
            partition="/",
            visible_on_warn=False,
            warn_color=fg,
        ),
    ]


def clock(bg, fg) -> list:
    return [
        modify(
            TextBox,
            **base(bg, fg),
            **icon_font(),
            **rectangle("left"),
            offset=2,
            text="",
            x=4,
        ),
        modify(
            Clock,
            **base(bg, fg),
            **rectangle("right"),
            format="%A - %I:%M %p ",
            long_format="%B %-d, %Y ",
            padding=6,
        ),
    ]


def tray(bg, fg) -> list:
    return widget.Systray(
        **base(bg, fg),
        fmt="{}",
        padding=5,
    )


def widgets():
    return [
        widget.Spacer(length=2),
        menu(palette.colorScheme[10], palette.currentColor),
        sep(palette.currentColor, offset=-8),
        groups(None),
        sep(palette.currentColor, offset=4, padding=4),
        *volume(palette.colorScheme[11], palette.currentColor),
        *backlight(palette.colorScheme[12], palette.currentColor),
        *updates(palette.colorScheme[13], palette.currentColor),
        sep(palette.currentColor, offset=4, padding=4),
        power(palette.colorScheme[9], palette.currentColor),
        widget.Spacer(),
        window_name(None, palette.foregroundColor),
        widget.Spacer(),
        *cpu(palette.colorScheme[11], palette.currentColor),
        *ram(palette.colorScheme[12], palette.currentColor),
        *disk(palette.colorScheme[13], palette.currentColor),
        sep(palette.currentColor),
        tray(None, palette.currentColor),
        sep(palette.currentColor),
        *clock(palette.colorScheme[14], palette.currentColor),
        widget.Spacer(length=2),
    ]
