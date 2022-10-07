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

import re
import json
import socket
import locale
import subprocess

from datetime import datetime

locale.setlocale(locale.LC_ALL, '')

from libqtile import bar, layout, widget, hook
from libqtile.config import Key, Click, Drag, Screen, Group, Match, Rule, KeyChord
from libqtile.lazy import lazy
from libqtile.dgroups import simple_key_binder

###################
## Color Schemes ##
###################

minimalmistakes = [
    ["#283036", "#283036"],  # 0
    ["#ff5959", "#ff5959"],  # 1
    ["#59ff59", "#59ff59"],  # 2
    ["#ffff59", "#ffff59"],  # 3
    ["#9059ff", "#9059ff"],  # 4
    ["#ff59f9", "#ff59f9"],  # 5
    ["#59fff9", "#59fff9"],  # 6
    ["#e5e9f0", "#e5e9f0"],  # 7
    ["#43515e", "#43515e"],  # 8
    ["#ffa6a6", "#ffa6a6"],  # 9
    ["#a6ffa6", "#a6ffa6"],  # 10
    ["#ffffa6", "#ffffa6"],  # 11
    ["#c5a6ff", "#c5a6ff"],  # 12
    ["#ffa6fc", "#ffa6fc"],  # 13
    ["#a6fffc", "#a6fffc"],  # 14
    ["#e5e9f0", "#e5e9f0"],  # 15
]

###########
## Utils ##
###########


class Commands(object):
    editor = 'code'
    menu = 'repomenu_run -i -l 10 -w 600 -c -p "Launcher" -q "Launch a app"'
    browser = 'firefox'
    terminal = 'alacritty'
    power = 'repomenue_powermenu'
    vbox = 'virt-manager'
    files = 'nemo'
    mail = 'thunderbird'

    autostart = [browser, terminal, files]


def to_urgent(qtile):
    cg = qtile.currentGroup
    for group in qtile.groupMap.values():
        if group == cg:
            continue
        if len([w for w in group.windows if w.urgent]) > 0:
            qtile.currentScreen.setGroup(group)
            return


def switch_to(name):

    def callback(qtile):
        for window in qtile.windowMap.values():
            if window.group and window.match(wname=name):
                qtile.currentScreen.setGroup(window.group)
                window.group.focus(window, False)
                break

    return callback


##################
## Key Bindings ##
##################

ALT = 'mod1'
MOD = 'mod4'
CTRL = 'control'
SHIFT = 'shift'

keys = [
    # qtile commands
    Key([MOD, SHIFT], "r", lazy.reload_config(), desc="Reload the config"),

    # Switch between windows
    Key([MOD], "h", lazy.layout.left(), desc="Move focus to left"),
    Key([MOD], "l", lazy.layout.right(), desc="Move focus to right"),
    Key([MOD], "j", lazy.layout.down(), desc="Move focus down"),
    Key([MOD], "k", lazy.layout.up(), desc="Move focus up"),

    # Grow windows. If current window is on the edge of screen and direction
    # will be to screen edge - window would shrink.
    KeyChord([MOD],
             "r", [
                 Key([], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
                 Key([], "l", lazy.layout.grow_right(), desc="Grow window to the right"),
                 Key([], "j", lazy.layout.grow_down(), desc="Grow window down"),
                 Key([], "k", lazy.layout.grow_up(), desc="Grow window up"),
             ],
             mode=True,
             name="Resize Windows"),
    # reset all windows
    Key([MOD], "n", lazy.layout.normalize(), desc="Reset all window sizes"),

    # Toggle between different layouts as defined below
    Key([MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
    Key([MOD], "q", lazy.window.kill(), desc="Kill focused window"),

    # Custom keybinds
    Key([MOD], "Return", lazy.spawn(Commands.terminal), desc="Launch terminal"),
    Key([MOD], "m", lazy.spawn(Commands.menu), desc="Launch menu"),
    Key([MOD, CTRL], "c", lazy.spawn(Commands.editor), desc="Launch editor"),
    Key([MOD, SHIFT], "Return", lazy.spawn(Commands.files), desc="Launch files"),

    # Audio Settings
    Key([], "XF86AudioMute", lazy.spawn("amixer -D pulse set Master toggle")),
    Key([], "XF86AudioLowerVolume", lazy.spawn("amixer -D pulse sset Master '5%-' unmute")),
    Key([], "XF86AudioRaiseVolume", lazy.spawn("amixer -D pulse sset Master '5%+' unmute")),

    # https://github.com/acrisci/playerctl/
    Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
    Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),

    # xBacklight
    Key([], "XF86MonBrightnessUp", lazy.spawn("xbacklight +10")),
    Key([], "XF86MonBrightnessDown", lazy.spawn("xbacklight -10")),
]

dgroups_key_binder = simple_key_binder(MOD)
dgroups_app_rules = []  # type: list

############
## Groups ##
############

groups = [
    # first group that hold the terminals
    Group('Terminal',
          init=True,
          exclusive=False,
          persist=False,
          matches=[Match(wm_class=['Alacritty', 'kitty'])],
          position=1,
          screen_affinity=1),
    Group('Editor',
          init=True,
          exclusive=False,
          persist=False,
          matches=[Match(wm_class=['Code'])],
          position=2,
          screen_affinity=1),
    Group('Files',
          init=True,
          exclusive=False,
          persist=False,
          matches=[Match(wm_class=['Nemo'])],
          position=3,
          screen_affinity=1),
    Group('Graphics',
          init=True,
          exclusive=False,
          persist=False,
          matches=[Match(wm_class=['Nemo'])],
          position=4,
          screen_affinity=1),
    Group('Music',
          init=True,
          exclusive=False,
          persist=False,
          matches=[Match(wm_class=['Nemo'])],
          position=5,
          screen_affinity=1),
    Group('WebBrowser',
          init=True,
          persist=False,
          exclusive=False,
          matches=[Match(wm_class=['firefox'], role=['browser'])],
          position=6,
          screen_affinity=2),
    Group(
        'Mail',
        init=True,
        persist=False,
        exclusive=False,
        #   matches=[Match(wm_class=['firefox'])],
        position=7,
        screen_affinity=2),
    Group(
        'Games',
        init=True,
        persist=False,
        exclusive=False,
        #   matches=[Match(wm_class=['firefox'])],
        position=8,
        screen_affinity=2),
    Group(
        'Chat',
        init=True,
        persist=False,
        exclusive=False,
        #   matches=[Match(wm_class=['firefox'])],
        position=9,
        screen_affinity=2),
    Group(
        'Settings',
        init=True,
        persist=False,
        exclusive=False,
        #   matches=[Match(wm_class=['firefox'])],
        position=10,
        screen_affinity=2),
]

####################
## Layouts Config ##
####################

# Layout Theme
layout_theme = {"border_width": 2, "margin": 5, "border_focus": "#a6ffa6", "border_normal": "#434c5e"}

layouts = [
    layout.Tile(**layout_theme),
    layout.Columns(**layout_theme),
    layout.Max(),
    # Try more layouts by unleashing below layouts.
    layout.Stack(**layout_theme, num_stacks=2),
    # layout.Bsp(**layout_theme),
    layout.Matrix(**layout_theme),
    layout.MonadTall(**layout_theme),
    layout.MonadWide(**layout_theme),
    layout.RatioTile(**layout_theme),
    # layout.TreeTab(**layout_theme),
    # layout.VerticalTile(**layout_theme),
    # layout.Zoomy(**layout_theme),
]

floating_layout = layout.Floating(**layout_theme)

###################
## Screen Config ##
###################

widget_defaults = dict(
    font="SauceCodePro Nerd Font",
    foreground=minimalmistakes[15],
    fontsize=12,
    padding=3,
)
extension_defaults = widget_defaults.copy()

screens = [
    Screen(
        top=bar.Bar(
            [
                widget.Sep(fmt=' {}', linewidth=10, foreground=minimalmistakes[0]),
                widget.GroupBox(hide_unused=True,
                                borderwidth=2,
                                active=minimalmistakes[11],
                                inactive=minimalmistakes[1],
                                this_screen_border=minimalmistakes[9],
                                this_current_screen_border=minimalmistakes[6],
                                urgent_border=minimalmistakes[12],
                                urgent_text=minimalmistakes[12],
                                visible_groups=["Terminal", "Editor", "Files", "Graphics", "Music"]),
                widget.Prompt(fmt=' {}'),
                widget.WindowName(fmt=' {}', max_chars=32),
                widget.Notify(fmt=' {}'),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[1],
                    padding=-2,
                ),
                widget.CurrentLayout(
                    fmt=' {}',
                    background=minimalmistakes[1],
                    foreground=minimalmistakes[0],
                ),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[2],
                    background=minimalmistakes[1],
                    padding=-2,
                ),
                widget.Volume(
                    fmt=' {}',
                    background=minimalmistakes[2],
                    foreground=minimalmistakes[0],
                ),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[3],
                    background=minimalmistakes[2],
                    padding=-2,
                ),
                widget.Battery(
                    fmt=' {}',
                    background=minimalmistakes[3],
                    foreground=minimalmistakes[0],
                    format='{char} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f} W',
                ),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[4],
                    background=minimalmistakes[3],
                    padding=-2,
                ),
                widget.Backlight(
                    fmt=' {}',
                    backlight_name="intel_backlight",
                    background=minimalmistakes[4],
                    foreground=minimalmistakes[0],
                ),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[5],
                    background=minimalmistakes[4],
                    padding=-2,
                ),
                widget.Net(
                    fmt=' {}',
                    interface="wlp0s20f3",
                    background=minimalmistakes[5],
                    foreground=minimalmistakes[0],
                ),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[6],
                    background=minimalmistakes[5],
                    padding=-2,
                ),
                widget.Clock(
                    fmt=' {}',
                    format='%Y-%m-%d %H:%M',
                    background=minimalmistakes[6],
                    foreground=minimalmistakes[0],
                ),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[0],
                    background=minimalmistakes[6],
                    padding=-2,
                ),
                widget.Systray(fmt=' {}'),
                widget.Sep(fmt=' {}', linewidth=10, foreground=minimalmistakes[0]),
            ],
            24,
            background=minimalmistakes[0],
            margin=5,
            # border_width=[2, 2, 2, 2],  # Draw top and bottom borders
            # border_color=["#a6ffa6", "#a6ffa6", "#a6ffa6",
            #               "#a6ffa6"]  # Borders are green
        ),
        bottom=bar.Bar(
            [
                widget.NvidiaSensors(),
                widget.WindowName(fmt=' {}', max_chars=32),
                widget.Chord(
                    fmt=' {}',
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                # widget.SwapGraph(fmt=' {}', type='box'),
                # widget.NetGraph(fmt=' {}', type='box'),
                # widget.MemoryGraph(fmt=' {}', type='box'),
                # widget.HDDGraph(fmt=' {}', type='box'),
                # widget.CPUGraph(fmt=' {}', type='box'),
                widget.TextBox("Press &lt;M-r&gt; to spawn", fmt=' {}', foreground="#d75f5f"),
                widget.Clock(fmt=' {}', format="%Y-%m-%d %a %I:%M %p"),
            ],
            24,
            background=minimalmistakes[0],
            margin=5,
            # border_width=[2, 2, 2, 2],  # Draw top and bottom borders
            # border_color=["#a6ffa6", "#a6ffa6", "#a6ffa6",
            #               "#a6ffa6"]  # Borders are green
        ),
    ),
    Screen(
        top=bar.Bar(
            [
                widget.Sep(fmt=' {}', linewidth=10, foreground=minimalmistakes[0]),
                widget.GroupBox(fmt=' {}',
                                hide_unused=True,
                                borderwidth=2,
                                active=minimalmistakes[11],
                                inactive=minimalmistakes[0],
                                this_screen_border=minimalmistakes[9],
                                this_current_screen_border=minimalmistakes[6],
                                urgent_border=minimalmistakes[12],
                                urgent_text=minimalmistakes[12],
                                visible_groups=["WebBrowser", "Mail", "Games", "Chat", "Settings"]),
                widget.Prompt(fmt=' {}'),
                widget.WindowName(fmt=' {}', max_chars=32),
                widget.Notify(fmt=' {}'),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[1],
                    padding=-2,
                ),
                widget.CurrentLayout(
                    fmt=' {}',
                    background=minimalmistakes[1],
                    foreground=minimalmistakes[0],
                ),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[2],
                    background=minimalmistakes[1],
                    padding=-2,
                ),
                widget.Volume(
                    fmt=' {}',
                    background=minimalmistakes[2],
                    foreground=minimalmistakes[0],
                ),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[3],
                    background=minimalmistakes[2],
                    padding=-2,
                ),
                widget.Battery(
                    fmt=' {}',
                    background=minimalmistakes[3],
                    foreground=minimalmistakes[0],
                    format='{char} {percent:2.0%} {hour:d}:{min:02d} {watt:.2f} W',
                ),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[4],
                    background=minimalmistakes[3],
                    padding=-2,
                ),
                widget.Backlight(
                    fmt=' {}',
                    backlight_name="intel_backlight",
                    background=minimalmistakes[4],
                    foreground=minimalmistakes[0],
                ),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[5],
                    background=minimalmistakes[4],
                    padding=-2,
                ),
                widget.Net(
                    fmt=' {}',
                    interface="wlp0s20f3",
                    background=minimalmistakes[5],
                    foreground=minimalmistakes[0],
                ),
                widget.TextBox(
                    text='🞀',
                    fontsize="50",
                    foreground=minimalmistakes[6],
                    background=minimalmistakes[5],
                    padding=-2,
                ),
                widget.Clock(
                    fmt=' {}',
                    format='%Y-%m-%d %H:%M',
                    background=minimalmistakes[6],
                    foreground=minimalmistakes[0],
                ),
                widget.Sep(fmt=' {}', linewidth=10, foreground=minimalmistakes[0]),
            ],
            24,
            background=minimalmistakes[0],
            margin=5,
            # border_width=[2, 2, 2, 2],  # Draw top and bottom borders
            # border_color=["#a6ffa6", "#a6ffa6", "#a6ffa6",
            #               "#a6ffa6"]  # Borders are green
        ),
        bottom=bar.Bar(
            [
                widget.Prompt(fmt=' {}'),
                widget.WindowName(fmt=' {}', max_chars=32),
                widget.Chord(
                    fmt=' {}',
                    chords_colors={
                        "launch": ("#ff0000", "#ffffff"),
                    },
                    name_transform=lambda name: name.upper(),
                ),
                widget.TextBox("default config", fmt=' {}', name="default"),
                widget.TextBox("Press &lt;M-r&gt; to spawn", fmt=' {}', foreground="#d75f5f"),
                widget.Clock(fmt=' {}', format="%Y-%m-%d %a %I:%M %p"),
            ],
            24,
            background=minimalmistakes[0],
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
    Drag([MOD], "Button1", lazy.window.set_position_floating(), start=lazy.window.get_position()),
    Drag([MOD], "Button3", lazy.window.set_size_floating(), start=lazy.window.get_size()),
    Click([MOD], "Button2", lazy.window.bring_to_front()),
]

###################
## Other Configs ##
###################

follow_mouse_focus = True
bring_front_click = False
cursor_warp = False
floating_layout = layout.Floating(float_rules=[
    # Run the utility of `xprop` to see the wm class and name of an X client.
    *layout.Floating.default_float_rules,
    Match(wm_class="confirmreset"),  # gitk
    Match(wm_class="makebranch"),  # gitk
    Match(wm_class="maketag"),  # gitk
    Match(wm_class="ssh-askpass"),  # ssh-askpass
    Match(title="branchdialog"),  # gitk
    Match(title="pinentry"),  # GPG key password entry
])
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
wmname = "LG3D"


@hook.subscribe.startup_once
def start_once():
    for command in Commands.autostart:
        subprocess.Popen([command], shell=True)