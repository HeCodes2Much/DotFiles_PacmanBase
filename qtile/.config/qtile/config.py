#!/usr/bin/env python

# Copyright 2022 The-Repo-Club <wayne6324@gmail.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
# copies of the Software, and to permit persons to whom the Software is
# furnished to do so, subject to the following conditions:

# The above copyright notice and this permission notice shall be included in all
# copies or substantial portions of the Software.

# THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
# IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
# FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
# AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
# LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
# OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN THE
# SOFTWARE.

import locale
import subprocess

from widgets import Widgets
from groups import Groups
from colors import colorScheme, currentColor

locale.setlocale(locale.LC_ALL, "")

from libqtile import qtile, bar, layout, hook
from libqtile.config import (
    Key,
    Click,
    Drag,
    Screen,
    Match,
    KeyChord,
    ScratchPad,
    DropDown,
)
from libqtile.lazy import lazy

from typing import Callable

###################
## Color Schemes ##
###################

from colors import foregroundColor, backgroundColor

###########
## Utils ##
###########


def go_to_group(name: str) -> Callable:
    def _inner(qtile: qtile) -> None:
        if len(qtile.screens) == 1:
            qtile.groups_map[name].cmd_toscreen()
            return

        if name in "12345":
            qtile.focus_screen(0)
            qtile.groups_map[name].cmd_toscreen()
        else:
            qtile.focus_screen(1)
            qtile.groups_map[name].cmd_toscreen()

    return _inner


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
    # configure = ['autorandr --load qtile']


##################
## Key Bindings ##
##################

ALT = "mod1"
MOD = "mod4"
CTRL = "control"
SHIFT = "shift"

keys = [
    # qtile commands
    Key([MOD, SHIFT], "r", lazy.reload_config(), desc="Reload the config"),
    Key([MOD, CTRL], "r", lazy.restart(), desc="Restart qtile"),
    # Switch between windows
    Key([MOD], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD], "j", lazy.layout.down(), desc="Move focus down"),
    Key([MOD], "k", lazy.layout.up(), desc="Move focus up"),
    # reset all windows
    Key([MOD], "n", lazy.layout.normalize(), desc="Reset all window sizes"),
    # Toggle between different layouts as defined below
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD], "t", lazy.window.toggle_floating(), desc="Toggle floating"),
    Key([MOD], "q", lazy.window.kill(), desc="Kill focused window"),
    # Custom keybinds
    Key([MOD], "Return", lazy.spawn(Commands.terminal), desc="Launch terminal"),
    Key([MOD], "m", lazy.spawn(Commands.menu), desc="Launch menu"),
    Key([MOD], "p", lazy.spawn(Commands.passmenu), desc="Launch password menu"),
    Key([MOD, CTRL], "f", lazy.spawn(Commands.browser), desc="Launch browser"),
    Key([MOD, CTRL], "c", lazy.spawn(Commands.editor), desc="Launch editor"),
    Key([MOD, SHIFT], "e", lazy.spawn(Commands.powermenu), desc="Launch power menu"),
    Key([MOD, SHIFT], "Return", lazy.spawn(Commands.files), desc="Launch files"),
    Key([MOD], "b", lazy.spawn(Commands.btop), desc="Launch btop"),
    # Audio Settings
    Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse set Master toggle")),
    Key(
        [],
        "XF86AudioLowerVolume",
        lazy.spawn("amixer -D pulse sset Master '5%-' unmute"),
    ),
    Key(
        [],
        "XF86AudioRaiseVolume",
        lazy.spawn("amixer -D pulse sset Master '5%+' unmute"),
    ),
    # https://github.com/acrisci/playerctl/
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),
    # xBacklight
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight +10")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -10")),
]

keys.extend(
    [
        ################
        ## Key Chords ##
        ################
        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        KeyChord(
            [MOD],
            "r",
            [
                Key([], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
                Key([], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
                Key([], "j", lazy.layout.grow_down(), desc="Grow window down"),
                Key([], "k", lazy.layout.grow_up(), desc="Grow window up"),
            ],
            mode=True,
            name="Resize Windows",
        ),
        KeyChord(
            [MOD, CTRL],
            "g",
            [
                Key([], "s", lazy.spawn("prime-run steam"), desc="Spawn steam"),
                Key([], "m", lazy.spawn("prime-run minecraft"), desc="Spawn minecraft"),
            ],
            mode=False,
            name="Launch Game",
        ),
        KeyChord(
            [MOD],
            "Print",
            [
                Key([], "w", lazy.spawn("win-shot -w"), desc="Screen Shot Window"),
                Key([], "s", lazy.spawn("win-shot -s"), desc="Screen Shot Selected"),
                Key([], "f", lazy.spawn("win-shot -f"), desc="Screen Shot Full"),
            ],
            mode=False,
            name="Take a Screenshot",
        ),
    ]
)

############
## Groups ##
############

groups = Groups.groups

# Define scratchpads
groups.append(
    ScratchPad(
        "Hyper_L",
        [
            DropDown(
                "term",
                "kitty --name=scratch",
                width=0.6,
                height=0.6,
                x=0.2,
                y=0.1,
                opacity=1,
            ),
            DropDown(
                "clifm",
                "kitty --name=clifm -e clifm",
                width=0.6,
                height=0.6,
                x=0.2,
                y=0.1,
                opacity=0.8,
            ),
            DropDown(
                "btop",
                "kitty --name=btop -e btop",
                width=0.6,
                height=0.6,
                x=0.2,
                y=0.1,
                opacity=0.8,
            ),
            DropDown(
                "volume",
                "pavucontrol",
                width=0.6,
                height=0.6,
                x=0.2,
                y=0.1,
                opacity=0.8,
            ),
        ],
    )
)

for i in groups:
    keys.extend(
        [
            Key([MOD], i.name, lazy.function(go_to_group(i.name))),
            Key([MOD, "shift"], i.name, lazy.window.togroup(i.name)),
        ]
    )

# Scratchpad keybindings
keys.extend(
    [
        Key([CTRL], "Return", lazy.group["Hyper_L"].dropdown_toggle("term")),
        Key([ALT], "c", lazy.group["Hyper_L"].dropdown_toggle("clifm")),
        Key([ALT], "b", lazy.group["Hyper_L"].dropdown_toggle("btop")),
        Key([ALT], "v", lazy.group["Hyper_L"].dropdown_toggle("volume")),
    ]
)


####################
## Layouts Config ##
####################

# Layout Theme
layout_theme = {
    "border_width": 2,
    "margin": 5,
    "border_focus": colorScheme[10],
    "border_normal": currentColor,
}

layouts = [
    layout.Tile(
        **layout_theme,
        add_after_last=True,
    ),
    layout.Columns(
        **layout_theme,
    ),
    layout.Max(
        **layout_theme,
    ),
    # Try more layouts by unleashing below layouts.
    layout.Stack(**layout_theme, num_stacks=2),
    # layout.Bsp(**layout_theme),
    layout.MonadThreeCol(
        **layout_theme,
        ratio=0.4,
        new_client_position="after_current",
    ),
    layout.Matrix(
        **layout_theme,
    ),
    layout.MonadTall(
        **layout_theme,
    ),
    layout.MonadWide(
        **layout_theme,
    ),
    layout.RatioTile(
        **layout_theme,
    ),
    # layout.TreeTab(**layout_theme,),
    # layout.VerticalTile(**layout_theme,),
    layout.Zoomy(
        **layout_theme,
    ),
]

floating_layout = layout.Floating(
    **layout_theme,
    float_rules=[
        # Run the utility of `xprop` to see the wm class and name of an X client.
        *layout.Floating.default_float_rules,
        Match(wm_class="confirmreset"),  # gitk
        Match(wm_class="makebranch"),  # gitk
        Match(wm_class="maketag"),  # gitk
        Match(wm_class="ssh-askpass"),  # ssh-askpass
        Match(title="branchdialog"),  # gitk
        Match(title="pinentry"),  # GPG key password entry
    ],
)

###################
## Screen Config ##
###################

widget_defaults = dict(
    font="Hack Nerd Font",
    foreground=foregroundColor,
    background=backgroundColor,
    fontsize=14,
    padding=2,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                Widgets.launcher,
                Widgets.sep,
                Widgets.groupBox1,
                Widgets.sep,
                Widgets.power1,
                Widgets.sep,
                Widgets.windowName1,
                Widgets.sep,
                Widgets.updates,
                Widgets.sep,
                Widgets.volume,
                Widgets.sep,
                Widgets.battery,
                Widgets.sep,
                Widgets.backlight,
                Widgets.sep,
                Widgets.net,
                Widgets.sep,
                Widgets.date,
                Widgets.time,
                Widgets.sep,
                Widgets.tray,
                Widgets.sep,
                Widgets.currentLayout1,
            ],
            28,
            background=backgroundColor,
            margin=5,
            # border_width=[2, 2, 2, 2],  # Draw top and bottom borders
            # border_color=["#a6ffa6", "#a6ffa6", "#a6ffa6",
            #               "#a6ffa6"]  # Borders are green
        ),
        bottom=bar.Bar(
            [
                Widgets.weather,
                Widgets.sep,
                Widgets.space,
                Widgets.picom,
                Widgets.sep,
                Widgets.github1,
                Widgets.sep,
                Widgets.chords,
            ],
            28,
            background=backgroundColor,
            margin=5,
            # border_width=[2, 2, 2, 2],  # Draw top and bottom borders
            # border_color=["#a6ffa6", "#a6ffa6", "#a6ffa6",
            #               "#a6ffa6"]  # Borders are green
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                Widgets.launcher,
                Widgets.sep,
                Widgets.groupBox2,
                Widgets.sep,
                Widgets.power2,
                Widgets.sep,
                Widgets.windowName2,
                Widgets.sep,
                Widgets.updates,
                Widgets.sep,
                Widgets.volume,
                Widgets.sep,
                Widgets.battery,
                Widgets.sep,
                Widgets.backlight,
                Widgets.sep,
                Widgets.net,
                Widgets.sep,
                Widgets.date,
                Widgets.time,
                Widgets.sep,
                Widgets.currentLayout2,
            ],
            28,
            background=backgroundColor,
            margin=5,
            # border_width=[2, 2, 2, 2],  # Draw top and bottom borders
            # border_color=["#a6ffa6", "#a6ffa6", "#a6ffa6",
            #               "#a6ffa6"]  # Borders are green
        ),
        bottom=bar.Bar(
            [
                Widgets.weather,
                Widgets.sep,
                Widgets.space,
                Widgets.picom,
                Widgets.sep,
                Widgets.github2,
                Widgets.sep,
                Widgets.chords,
            ],
            28,
            background=backgroundColor,
            margin=5,
            # border_width=[2, 2, 2, 2],  # Draw top and bottom borders
            # border_color=["#a6ffa6", "#a6ffa6", "#a6ffa6",
            #               "#a6ffa6"]  # Borders are green
        ),
    ),
]

###################
## Floating Drag ##
###################
mouse = [
    Drag(
        [MOD],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()
    ),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

###################
## Other Configs ##
###################

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
auto_fullscreen = True
focus_on_window_activation = "smart"
reconfigure_screens = True

# If things like steam games want to auto-minimize themselves when losing
# focus, should we respect this or not?
auto_minimize = True

# When using the Wayland backend, this can be used to configure input devices.
wl_input_rules = None

# XXX: Gasp! We're lying here. In fact, nobody really uses or cares about this
# string besides java UI toolkits; you can see several discussions on the
# mailing lists, GitHub issues, and other WM documentation that suggest setting
# this string if your java app doesn't work correctly. We may as well just lie
# and say that we're a working one by default.
#
# We choose LG3D to maximize irony: it is a 3D non-reparenting WM written in
# java that happens to be on java's whitelist.
wmname = "Qtile"


@hook.subscribe.screens_reconfigured
async def _():
    if len(qtile.screens) > 1:
        Widgets.groupBox1.visible_groups = ["1", "2", "3", "4", "5"]
        Widgets.groupBox2.visible_groups = ["6", "7", "8", "9", "0"]
    else:
        Widgets.groupBox1.visible_groups = [
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "0",
        ]


@hook.subscribe.startup_once
def start_once():
    if len(qtile.screens) > 1:
        Widgets.groupBox1.visible_groups = ["1", "2", "3", "4", "5"]
        Widgets.groupBox2.visible_groups = ["6", "7", "8", "9", "0"]
    else:
        Widgets.groupBox1.visible_groups = [
            "1",
            "2",
            "3",
            "4",
            "5",
            "6",
            "7",
            "8",
            "9",
            "0",
        ]

    for configure in Commands.configure:
        subprocess.Popen([configure], shell=True)

    for command in Commands.autostart:
        subprocess.Popen([command], shell=True)


@hook.subscribe.client_managed
def auto_focus(window):
    window.group.cmd_toscreen()
