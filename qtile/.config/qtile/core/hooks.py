import asyncio
import subprocess

from libqtile import hook

from core.screens import screens

bars = [screen.top for screen in screens]
margins = [sum(bar.margin) if bar else -1 for bar in bars]  # type: ignore
configure = [
    "autostart",
    "youtube_subs -d",
    "autorandr --load qtile",
    "setxkbmap -option caps:escape",
]


@hook.subscribe.startup
def startup():
    for bar, margin in zip(bars, margins):
        if not margin:
            bar.window.window.set_property(
                name="WM_NAME",
                value="QTILE_BAR",
                type="STRING",
                format=8,
            )


@hook.subscribe.startup_once
def start_once():
    for command in configure:
        subprocess.Popen([command], shell=True)


@hook.subscribe.client_managed
def auto_focus(window):
    window.group.toscreen()


@hook.subscribe.client_new
async def client_new(client):
    await asyncio.sleep(0.5)
    if client.name == "Spotify":
        client.togroup("e")
