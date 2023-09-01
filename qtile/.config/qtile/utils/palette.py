from dataclasses import dataclass


@dataclass(frozen=True)
class MinimalMistakes:
    colorScheme = [
        "283036",  # 0
        "ff5959",  # 1
        "59ff59",  # 2
        "ffff59",  # 3
        "9059ff",  # 4
        "ff59f9",  # 5
        "59fff9",  # 6
        "e5e9f0",  # 7
        "43515e",  # 8
        "ffa6a6",  # 9
        "a6ffa6",  # 10
        "ffffa6",  # 11
        "c5a6ff",  # 12
        "ffa6fc",  # 13
        "a6fffc",  # 14
        "e5e9f0",  # 15
        "e5e9f0",  # foregroundColor
        "283036",  # backgroundColor
        "434c5e",  # selectionColor
    ]

    widgetColors = [
        "ff5959",  # 1
        "59ff59",  # 2
        "ffff59",  # 3
        "9059ff",  # 4
        "ff59f9",  # 5
        "ff5959",  # 6
        "59ff59",  # 7
        "ffff59",  # 8
        "9059ff",  # 9
        "ff59f9",  # 10
    ]

    foregroundColor = colorScheme[16]
    backgroundColor = colorScheme[17]
    currentColor = colorScheme[18]


palette = MinimalMistakes()
