import json
from dataclasses import asdict, dataclass
from os import getcwd
from os.path import exists, expanduser, join


@dataclass
class Config:
    bar: str = "shapes"
    bar2: str = ""
    browser: str = ""
    term: str = ""
    term2: str = ""
    editor: str = ""
    files: str = ""
    menu: str = ""
    power: str = ""
    passwords: str = ""
    youtube: str = ""
    wallpaper: str = ""

    @staticmethod
    def path() -> str:
        xdg = expanduser("~/.config/qtile")
        return xdg if exists(xdg) else getcwd()

    @classmethod
    def load(cls) -> "Config":
        file = join(cls.path(), "cfg.json")
        if not exists(file):
            cls.generate(file)
            return cls()
        with open(file, "r") as f:
            content = json.load(f)
            return cls(**content)

    @classmethod
    def generate(cls, file: str) -> None:
        with open(file, "w") as f:
            content = asdict(cls())
            f.write(json.dumps(content, indent=2))


cfg = Config.load()
