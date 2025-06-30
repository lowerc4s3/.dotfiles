import os
from urllib.request import urlopen

# Load autoconfig
config.load_autoconfig()

# Load catppuccin
if os.path.exists(config.configdir / "catppuccin.py"):
    import catppuccin

    palette = catppuccin.get_palette("mocha")
    catppuccin.setup(c, palette, True)

    # Mocha palette (kinda sad that official ctp theme doesn't provide palette for user)
    palette = {
        "rosewater": "#f5e0dc",
        "flamingo": "#f2cdcd",
        "pink": "#f5c2e7",
        "mauve": "#cba6f7",
        "red": "#f38ba8",
        "maroon": "#eba0ac",
        "peach": "#fab387",
        "yellow": "#f9e2af",
        "green": "#a6e3a1",
        "teal": "#94e2d5",
        "sky": "#89dceb",
        "sapphire": "#74c7ec",
        "blue": "#89b4fa",
        "lavender": "#b4befe",
        "text": "#cdd6f4",
        "subtext1": "#bac2de",
        "subtext0": "#a6adc8",
        "overlay2": "#9399b2",
        "overlay1": "#7f849c",
        "overlay0": "#6c7086",
        "surface2": "#585b70",
        "surface1": "#45475a",
        "surface0": "#313244",
        "base": "#1e1e2e",
        "mantle": "#181825",
        "crust": "#11111b",
    }

    c.colors.tabs.odd.bg = palette["surface0"]
    c.colors.tabs.even.bg = palette["surface0"]

    c.colors.tabs.indicator.system = "hsl"
    c.colors.tabs.indicator.start = palette["blue"]
    c.colors.tabs.indicator.stop = palette["green"]

    c.colors.tabs.pinned.even.fg = palette["text"]
    c.colors.tabs.pinned.even.bg = palette["surface1"]
    c.colors.tabs.pinned.odd.fg = palette["text"]
    c.colors.tabs.pinned.odd.bg = palette["surface1"]

# Set russian keymaps
config.unbind(".")
en_keys = "qwertyuiop[]asdfghjkl;'zxcvbnm,./" + 'QWERTYUIOP{}ASDFGHJKL:"ZXCVBNM<>?'
ru_keys = "йцукенгшщзхъфывапролджэячсмитьбю." + "ЙЦУКЕНГШЩЗХЪФЫВАПРОЛДЖЭЯЧСМИТЬБЮ,"
c.bindings.key_mappings.update(dict(zip(ru_keys, en_keys)))

# Set flags to improve youtube playback (this one is old and i'm not sure if it's needed anymore)
config.set(
    "qt.args",
    [
        "ignore-gpu-blocklist",
        "enable-gpu-rasterization",
        "enable-accelerated-video-decode",
        "enable-quic",
        "enable-zero-copy",
    ],
)

# Don't change webpage bg
c.colors.webpage.bg = "white"

# config.bind(',p', 'spawn --userscript qute-pass')
# config.bind(',P', 'spawn --userscript qute-pass --password-only')
# config.bind('<ctrl-o>', 'open -w')
