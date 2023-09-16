from os import environ

from libqtile.config import Key, KeyChord
from libqtile.lazy import lazy
from libqtile.utils import guess_terminal

from extras import float_to_front
from utils.config import cfg

if int(environ.get("QTILE_XEPHYR", 0)) > 0:
    mod, alt = "mod1", "control"
    restart = lazy.restart()
else:
    mod, alt = "mod4", "mod1"
    restart = lazy.reload_config()

if not cfg.term:
    cfg.term = guess_terminal()

keys = [Key(*key) for key in [  # type: ignore
    # switch between windows
    ([mod], "h", lazy.layout.left()),
    ([mod], "l", lazy.layout.right()),
    ([mod], "j", lazy.layout.down()),
    ([mod], "k", lazy.layout.up()),

    # move windows between columns
    ([mod, "shift"], "h", lazy.layout.shuffle_left()),
    ([mod, "shift"], "l", lazy.layout.shuffle_right()),
    ([mod, "shift"], "j", lazy.layout.shuffle_down()),
    ([mod, "shift"], "k", lazy.layout.shuffle_up()),

    # increase/decrease window size
    ([mod], "d", lazy.layout.grow()),
    ([mod], "f", lazy.layout.shrink()),

    # window management
    ([mod, "shift"], "space", lazy.layout.flip()),
    ([mod], "o", lazy.layout.maximize()),
    ([mod], "n", lazy.layout.normalize()),
    ([mod], "q", lazy.window.kill()),
    ([mod, "control"], "space", lazy.window.toggle_fullscreen()),

    # floating window management
    ([mod], "space", lazy.window.toggle_floating()),
    ([mod, "shift"], "c", lazy.window.center()),
    ([mod], "x", lazy.function(float_to_front)),

    # toggle between layouts
    ([mod], "Tab", lazy.next_layout()),

    # qtile stuff
    ([mod, "control"], "b", lazy.hide_show_bar()),
    ([mod, "control"], "s", lazy.shutdown()),
    ([mod, "shift"], "r", restart),

    # terminal
    ([mod], "Return", lazy.spawn(cfg.term)),
    ([mod, "shift"], "Return", lazy.spawn(cfg.files)),

    # app launcher
    ([mod], "m", lazy.spawn(cfg.menu)),
    ([mod], "p", lazy.spawn(cfg.passwords)),
    ([mod], "y", lazy.spawn(cfg.youtube)),

    # web browser
    ([mod], "b", lazy.spawn(cfg.browser)),

    # code editor
    ([mod], "c", lazy.spawn(cfg.editor)),

    # backlight
    ([], "XF86MonBrightnessDown", lazy.spawn("brightnessctl set 5%-")),
    ([], "XF86MonBrightnessUp", lazy.spawn("brightnessctl set 5%+")),

    # volume
    ([], "XF86AudioMute", lazy.spawn("pamixer --toggle-mute")),
    ([], "XF86AudioLowerVolume", lazy.spawn("pamixer --decrease 5")),
    ([], "XF86AudioRaiseVolume", lazy.spawn("pamixer --increase 5")),

    # player
    ([], "XF86AudioPlay", lazy.spawn("playerctl play-pause")),
    ([], "XF86AudioPrev", lazy.spawn("playerctl previous")),
    ([], "XF86AudioNext", lazy.spawn("playerctl next")),
]]  # fmt: skip

keys.extend(
    [
        # Grow windows. If current window is on the edge of screen and direction
        # will be to screen edge - window would shrink.
        KeyChord(
            [mod],
            "r",
            [
                Key([], "h", lazy.layout.grow_left(), desc="Grow window to the left"),
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
            [mod, "control"],
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
            [mod],
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

keys.extend(
    [
        Key(
            ["control"],
            "Return",
            lazy.group["Hyper_L"].dropdown_toggle("term"),
        ),
        Key([alt], "c", lazy.group["Hyper_L"].dropdown_toggle("clifm")),
        Key([alt], "b", lazy.group["Hyper_L"].dropdown_toggle("btop")),
        Key([alt], "v", lazy.group["Hyper_L"].dropdown_toggle("volume")),
    ]
)
