from libqtile.config import Screen

from core.bar import Bar
from utils.config import cfg

screens = [
    Screen(
        wallpaper=cfg.wallpaper,
        wallpaper_mode="fill",
        top=Bar(cfg.mon0top).create(),
        bottom=Bar(cfg.mon0bottom).create(),
    ),
    Screen(
        wallpaper=cfg.wallpaper,
        wallpaper_mode="fill",
        top=Bar(cfg.mon1top).create(),
        bottom=Bar(cfg.mon1bottom).create(),
    ),
]
