import re
from libqtile import hook, qtile
from libqtile.config import Group, Match


class Groups(object):
    groups = [
        # first group that hold the terminals
        Group(
            label='一',
            init=True,
            persist=True,
            exclusive=False,
            matches=[Match(wm_class=re.compile('^Alacritty.*|^Kitty.*', re.IGNORECASE))],
            layout='monadthreecol',
            position=1,
            screen_affinity=1,
            name='1',
        ),
        Group(
            label='二',
            init=True,
            persist=True,
            exclusive=False,
            matches=[Match(wm_class=re.compile('^Code.*|^Jetbrains.*', re.IGNORECASE))],
            position=2,
            screen_affinity=1,
            name='2',
        ),
        Group(
            label='三',
            init=True,
            persist=True,
            exclusive=False,
            matches=[Match(wm_class=re.compile('^Nemo.*', re.IGNORECASE))],
            position=3,
            screen_affinity=1,
            name='3',
        ),
        Group(
            label='四',
            init=True,
            persist=True,
            exclusive=False,
            matches=[Match(wm_class=re.compile('^Aseprite.*|^Krita.*', re.IGNORECASE))],
            position=4,
            screen_affinity=1,
            name='4',
        ),
        Group(
            label='五',
            init=True,
            persist=True,
            exclusive=False,
            matches=[Match(wm_class=re.compile('^CmusImage.*', re.IGNORECASE))],
            position=5,
            screen_affinity=1,
            name='5',
        ),
        Group(
            label='六',
            init=True,
            persist=True,
            exclusive=False,
            matches=[Match(wm_class=re.compile('^Firefox.*|^Brave.*', re.IGNORECASE), role=['browser'])],
            position=6,
            screen_affinity=2,
            name='6',
        ),
        Group(
            label='七',
            init=True,
            persist=True,
            exclusive=False,
            matches=[Match(wm_class=re.compile('^Mail.*|^Thunderbird.*', re.IGNORECASE))],
            position=7,
            screen_affinity=2,
            name='7',
        ),
        Group(
            label='八',
            init=True,
            persist=True,
            exclusive=False,
            matches=[Match(wm_class=re.compile('^Steam.*|^Minecraft.*|^0ad.*', re.IGNORECASE))],
            position=8,
            screen_affinity=2,
            name='8',
        ),
        Group(
            label='九',
            init=True,
            persist=True,
            exclusive=False,
            matches=[Match(wm_class=re.compile('^Discord.*', re.IGNORECASE))],
            position=9,
            screen_affinity=2,
            name='9',
        ),
        Group(
            label='零',
            init=True,
            persist=True,
            exclusive=False,
            matches=[Match(wm_class=re.compile('^PkgBrowser.*|^Virt.*|^Btop.*', re.IGNORECASE))],
            position=10,
            screen_affinity=2,
            name='0',
        ),
    ]

# Store the screen_affinity for each group in a dictionary
group_screen_affinities = {group.name: group.screen_affinity for group in Groups.groups}

@hook.subscribe.client_focus
def enforce_screen_affinity(window):
    group_name = window.group.name

    # If the group has a specified screen_affinity, enforce it
    if group_name in group_screen_affinities:
        desired_screen = group_screen_affinities[group_name]
        current_screen = qtile.screens.index(qtile.current_screen)

        # If the window is focused on a different screen than the desired screen,
        # move the window back to the desired screen
        if current_screen != desired_screen:
            window.togroup(group_name)
