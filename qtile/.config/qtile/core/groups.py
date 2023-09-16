import re
from libqtile.config import Group, Key, Match, ScratchPad, DropDown
from libqtile.lazy import lazy

from core.keys import keys, mod

groups: list[Group] = []

for key, label, layout, matches in [
    (
        "1",
        "一",
        "monadthreecol",
        Match(wm_class=re.compile("^Alacritty.*|^Kitty.*", re.IGNORECASE)),
    ),
    (
        "2",
        "二",
        None,
        Match(wm_class=re.compile("^Code.*|^Jetbrains.*", re.IGNORECASE)),
    ),
    (
        "3",
        "三",
        None,
        Match(wm_class=re.compile("^Nemo.*", re.IGNORECASE)),
    ),
    (
        "4",
        "四",
        None,
        Match(wm_class=re.compile("^Aseprite.*|^Krita.*", re.IGNORECASE)),
    ),
    (
        "5",
        "五",
        None,
        Match(wm_class=re.compile("^CmusImage.*", re.IGNORECASE)),
    ),
    (
        "6",
        "六",
        None,
        Match(wm_class=re.compile("^Firefox.*|^Opera.*", re.IGNORECASE)),
    ),
    (
        "7",
        "七",
        None,
        Match(wm_class=re.compile("^Mail.*|^Thunderbird.*", re.IGNORECASE)),
    ),
    (
        "8",
        "八",
        None,
        Match(wm_class=re.compile("^Steam.*|^Minecraft.*|^0ad.*", re.IGNORECASE)),
    ),
    (
        "9",
        "九",
        None,
        Match(wm_class=re.compile("^Discord.*", re.IGNORECASE)),
    ),
    (
        "0",
        "零",
        None,
        Match(wm_class=re.compile("^Software.*|^Virt.*|^Btop.*", re.IGNORECASE)),
    ),
]:
    groups.append(
        Group(
            name=key,
            position=key,
            matches=matches,
            label=label,
            layout=layout,
        )
    )

    keys.extend([
        # mod1 + letter of group = switch to group
        Key([mod], key, lazy.group[key].toscreen(toggle=True)),

        # mod1 + shift + letter of group = move focused window to group
        Key([mod, "shift"], key, lazy.window.togroup(key)),
    ])  # fmt: skip

    groups.append(
        ScratchPad(
            "Hyper_L",
            [
                DropDown(
                    "term",
                    "alacritty --class Scratch",
                    width=0.6,
                    height=0.6,
                    x=0.2,
                    y=0.1,
                    opacity=1,
                ),
                DropDown(
                    "clifm",
                    "alacritty --class CliFM -e clifm",
                    width=0.6,
                    height=0.6,
                    x=0.2,
                    y=0.1,
                    opacity=0.8,
                ),
                DropDown(
                    "btop",
                    "alacritty --class bTop -e btop",
                    width=0.6,
                    height=0.6,
                    x=0.2,
                    y=0.1,
                    opacity=0.8,
                ),
                DropDown(
                    "volume",
                    "PavuControl",
                    width=0.6,
                    height=0.6,
                    x=0.2,
                    y=0.1,
                    opacity=0.8,
                ),
            ],
        )
    )
