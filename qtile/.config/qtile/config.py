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

locale.setlocale(locale.LC_ALL, '')

from libqtile import bar, layout, hook
from libqtile.config import Key, Click, Drag, Screen, Group, Match, KeyChord, ScratchPad, DropDown
from libqtile.lazy import lazy
from libqtile.dgroups import simple_key_binder

###################
## Color Schemes ##
###################

from colors import foregroundColor, backgroundColor

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
    kill = 'repomenue_kill'

    autostart = [files, terminal, browser]
    configure = ['autorandr --load qtile', 'autostart']


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
    Key([MOD, CTRL], "r", lazy.restart(), desc="Restart qtile"),

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
    Key([MOD, SHIFT], "q", lazy.spawn(Commands.kill), desc="Launch kill menu"),

    # Custom keybinds
    Key([MOD], "Return", lazy.spawn(Commands.terminal), desc="Launch terminal"),
    Key([MOD], "m", lazy.spawn(Commands.menu), desc="Launch menu"),
    Key([MOD, CTRL], "f", lazy.spawn(Commands.browser), desc="Launch browser"),
    Key([MOD, CTRL], "c", lazy.spawn(Commands.editor), desc="Launch editor"),
    Key([MOD, SHIFT], "e", lazy.spawn(Commands.power), desc="Launch power menu"),
    Key([MOD, SHIFT], "Return", lazy.spawn(Commands.files), desc="Launch files"),
    KeyChord([MOD, CTRL],
             "g", [
                 Key([], "s", lazy.spawn('prime-run steam'), desc="Spawn steam"),
             ],
             mode=False,
             name="Launch Game"),

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

groups = Groups.groups

# Define scratchpads
groups.append(
    ScratchPad("scratchpad", [
        DropDown("term", "alacritty --class=scratch", width=0.8, height=0.8, x=0.1, y=0.1, opacity=1),
        DropDown("clifm", "alacritty --class=clifm -e clifm", width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
        DropDown("volume", "pavucontrol", width=0.8, height=0.8, x=0.1, y=0.1, opacity=0.9),
    ]))

# Scratchpad keybindings
keys.extend([
    Key([CTRL], "Return", lazy.group['scratchpad'].dropdown_toggle('term')),
    Key([ALT], "c", lazy.group['scratchpad'].dropdown_toggle('clifm')),
    Key([ALT], "v", lazy.group['scratchpad'].dropdown_toggle('volume')),
])

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
    font="SauceCodePro Nerd Font",
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
                Widgets.windowName,
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
                Widgets.currentLayout,
            ],
            24,
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
            24,
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
                Widgets.windowName,
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
                Widgets.currentLayout,
            ],
            24,
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
            24,
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
wmname = "Qtile 0.22.1"


@hook.subscribe.startup_once
def start_once():
    for configure in Commands.configure:
        subprocess.Popen([configure], shell=True)

    for command in Commands.autostart:
        subprocess.Popen([command], shell=True)


@hook.subscribe.client_managed
def auto_focus(window):
    window.group.cmd_toscreen()