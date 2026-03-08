from pathlib import Path

from themer.material.generator import gen_scheme
from themer.material.score import score


class Scheme:
    def __init__(self, mode: str = "dark", variant: str = "tonalspot", flavour: str = "default"):
        self.mode = mode
        self.variant = variant
        self.flavour = flavour


def get_colours_for_image(
    image: Path | str, mode: str = "dark", variant: str = "tonalspot", flavour: str = "default"
) -> dict[str, str]:
    scheme = Scheme(mode=mode, variant=variant, flavour=flavour)
    primary = score(str(image))
    return gen_scheme(scheme, primary)
