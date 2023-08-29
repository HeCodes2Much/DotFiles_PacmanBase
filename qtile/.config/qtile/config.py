#!/usr/bin/env python

# Copyright 2022 The-Repo-Club <wayne6324@gmail.com>

# Permission is hereby granted, free of charge, to any person obtaining a copy
# of this software and associated documentation files (the "Software"), to deal
# in the Software without restriction, including without limitation the rights
# to use, copy, Variables.MODify, merge, publish, distribute, sublicense, and/or sell
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
from keys import Keys
from variables import Commands, Variables
from colors import colorScheme, currentColor

locale.setlocale(locale.LC_ALL, "")

from libqtile import qtile, bar, layout, hook
from libqtile.config import Key, Click, Drag, Screen, Match, ScratchPad, DropDown

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

##################
## Key Bindings ##
##################

keys = Keys.keys

for i in groups:
    keys.extend(
        [
            Key([Variables.MOD], i.name, lazy.function(go_to_group(i.name))),
            Key([Variables.MOD, "shift"], i.name, lazy.window.togroup(i.name)),
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
    # layout.VerticVariables.ALTile(**layout_theme,),
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
                Widgets.groupBox1,
                Widgets.currentLayout,
                Widgets.power,
                Widgets.windowName,
                Widgets.volume,
                Widgets.backlight,
                Widgets.net,
                Widgets.date,
                Widgets.time,
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
                Widgets.updates,
                Widgets.space,
                Widgets.tray,
                Widgets.sep,
                Widgets.xcompmgr,
                Widgets.github,
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
                Widgets.groupBox2,
                Widgets.currentLayout,
                Widgets.power,
                Widgets.windowName,
                Widgets.volume,
                Widgets.backlight,
                Widgets.net,
                Widgets.date,
                Widgets.time,
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
                Widgets.updates,
                Widgets.space,
                Widgets.xcompmgr,
                Widgets.github,
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
        [Variables.MOD],
        "Button1",
        lazy.window.set_position_floating(),
        start=lazy.window.get_position(),
    ),
    Drag(
        [Variables.MOD],
        "Button3",
        lazy.window.set_size_floating(),
        start=lazy.window.get_size(),
    ),
    Click([Variables.MOD], "Button2", lazy.window.bring_to_front()),
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
