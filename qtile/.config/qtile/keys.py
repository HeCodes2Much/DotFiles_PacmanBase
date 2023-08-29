from variables import Commands, Variables

from libqtile.lazy import lazy

from libqtile.config import Key, KeyChord


class Keys(object):
    keys = [
        # qtile commands
        Key(
            [Variables.MOD, Variables.SHIFT],
            "r",
            lazy.reload_config(),
            desc="Reload the config",
        ),
        Key([Variables.MOD, Variables.CTRL], "r", lazy.restart(), desc="Restart qtile"),
        # Switch between windows
        Key([Variables.MOD], "h", lazy.layout.left(), desc="Move focus to left"),
        Key([Variables.MOD], "l", lazy.layout.right(), desc="Move focus to right"),
        Key([Variables.MOD], "j", lazy.layout.down(), desc="Move focus down"),
        Key([Variables.MOD], "k", lazy.layout.up(), desc="Move focus up"),
        # reset all windows
        Key(
            [Variables.MOD], "n", lazy.layout.normalize(), desc="Reset all window sizes"
        ),
        # Toggle between different layouts as defined below
        Key([Variables.MOD], "Tab", lazy.next_layout(), desc="Toggle between layouts"),
        Key(
            [Variables.MOD], "t", lazy.window.toggle_floating(), desc="Toggle floating"
        ),
        Key([Variables.MOD], "q", lazy.window.kill(), desc="Kill focused window"),
        # Custom keybinds
        Key(
            [Variables.MOD],
            "Return",
            lazy.spawn(Commands.terminal),
            desc="Launch terminal",
        ),
        Key([Variables.MOD], "m", lazy.spawn(Commands.menu), desc="Launch menu"),
        Key(
            [Variables.MOD],
            "p",
            lazy.spawn(Commands.passmenu),
            desc="Launch password menu",
        ),
        Key(
            [Variables.MOD, Variables.CTRL],
            "f",
            lazy.spawn(Commands.browser),
            desc="Launch browser",
        ),
        Key(
            [Variables.MOD, Variables.CTRL],
            "c",
            lazy.spawn(Commands.editor),
            desc="Launch editor",
        ),
        Key(
            [Variables.MOD, Variables.SHIFT],
            "e",
            lazy.spawn(Commands.powermenu),
            desc="Launch power menu",
        ),
        Key(
            [Variables.MOD, Variables.SHIFT],
            "Return",
            lazy.spawn(Commands.files),
            desc="Launch files",
        ),
        Key([Variables.MOD], "b", lazy.spawn(Commands.btop), desc="Launch btop"),
        # Audio Settings
        Key([], "XF86AudioMute", lazy.spawn("amixer set Master toggle")),
        Key(
            [],
            "XF86AudioLowerVolume",
            lazy.spawn("amixer set Master '5%-' unmute"),
        ),
        Key(
            [],
            "XF86AudioRaiseVolume",
            lazy.spawn("amixer set Master '5%+' unmute"),
        ),
        # https://github.com/acrisci/playerctl/
        Key([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
        Key([], "XF86AudioNext", lazy.spawn("playerctl next")),
        Key([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
        Key([], "XF86AudioStop", lazy.spawn("playerctl stop")),
        # xBacklight
        Key([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set 5%+")),
        Key([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
    ]

    ################
    ## Key Chords ##
    ################

    keys.extend(
        [
            # Grow windows. If current window is on the edge of screen and direction
            # will be to screen edge - window would shrink.
            KeyChord(
                [Variables.MOD],
                "r",
                [
                    Key(
                        [], "h", lazy.layout.grow_left(), desc="Grow window to the left"
                    ),
                    Key(
                        [],
                        "l",
                        lazy.layout.grow_right(),
                        desc="Grow window to the right",
                    ),
                    Key([], "j", lazy.layout.grow_down(), desc="Grow window down"),
                    Key([], "k", lazy.layout.grow_up(), desc="Grow window up"),
                ],
                mode=True,
                name="Resize Windows",
            ),
            KeyChord(
                [Variables.MOD, Variables.CTRL],
                "g",
                [
                    Key([], "s", lazy.spawn("prime-run steam"), desc="Spawn steam"),
                    Key(
                        [],
                        "m",
                        lazy.spawn("prime-run minecraft"),
                        desc="Spawn minecraft",
                    ),
                ],
                mode=False,
                name="Launch Game",
            ),
            KeyChord(
                [Variables.MOD],
                "Print",
                [
                    Key([], "w", lazy.spawn("win-shot -w"), desc="Screen Shot Window"),
                    Key(
                        [], "s", lazy.spawn("win-shot -s"), desc="Screen Shot Selected"
                    ),
                    Key([], "f", lazy.spawn("win-shot -f"), desc="Screen Shot Full"),
                ],
                mode=False,
                name="Take a Screenshot",
            ),
        ]
    )

    # Scratchpad keybindings
    keys.extend(
        [
            Key(
                [Variables.CTRL],
                "Return",
                lazy.group["Hyper_L"].dropdown_toggle("term"),
            ),
            Key([Variables.ALT], "c", lazy.group["Hyper_L"].dropdown_toggle("clifm")),
            Key([Variables.ALT], "b", lazy.group["Hyper_L"].dropdown_toggle("btop")),
            Key([Variables.ALT], "v", lazy.group["Hyper_L"].dropdown_toggle("volume")),
        ]
    )
