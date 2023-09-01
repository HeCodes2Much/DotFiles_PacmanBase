from libqtile import layout

from utils.match import title, wm_class
from utils.palette import palette

layout_theme = {
    "border_focus": palette.colorScheme[10],
    "border_normal": palette.currentColor,
    "border_width": 2,
    "margin": 10,
    "single_border_width": 0,
    "single_margin": 10,
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
    layout.Stack(
        **layout_theme,
        num_stacks=2,
    ),
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
        change_ratio=0.02,
        min_ratio=0.30,
        max_ratio=0.70,
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
    border_focus=palette.colorScheme[4],
    border_normal=palette.currentColor,
    border_width=0,
    fullscreen_border_width=0,
    float_rules=[
        *layout.Floating.default_float_rules,
        *wm_class(
            "confirmreset",
            "Display",
            "floating",
            "gnome-screenshot",
            "gpicview",
            "lxappearance",
            "makebranch",
            "maketag",
            "pavucontrol",
            "psterm",
            "ssh-askpass",
            "steam",
            "thunar",
            "Xephyr",
            "xfce4-about",
        ),
        *title(
            "branchdialog",
            "minecraft-launcher",
            "pinentry",
        ),
    ],
)
