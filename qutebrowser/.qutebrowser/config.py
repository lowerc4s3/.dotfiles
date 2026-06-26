import os
from urllib.request import urlopen

# Load autoconfig
config.load_autoconfig()

def mod_exists(path):
    return os.path.exists(config.configdir / path)

if mod_exists("oxocarbon.py"):
    import oxocarbon as oxo
    oxo.setup(c)

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
# c.colors.webpage.bg = "white"

# config.bind(',p', 'spawn --userscript qute-pass')
# config.bind(',P', 'spawn --userscript qute-pass --password-only')
# config.bind('<ctrl-o>', 'open -w')
