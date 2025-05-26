# torrent-preview.yazi

[Yazi](https://github.com/sxyazi/yazi) plugin to preview `application/bittorrent` files

![show case](https://github.com/kirasok/torrent-preview.yazi/assets/75790517/6f215e6d-bb19-46f4-b606-9241594028ff)

## Requirements

- [yazi](https://github.com/sxyazi/yazi)
- [transmission-cli](https://github.com/transmission/transmission)

## Installation

### Linux/MacOS

Using the [Yazi Package Manager](https://yazi-rs.github.io/docs/cli/#package-manager):

```sh
ya pack -a kirasok/torrent-preview
```

Or manually:

```sh
git clone https://github.com/kirasok/torrent-preview.yazi.git ~/.config/yazi/plugins/torrent-preview.yazi
```

## Usage

Add this to your `yazi.toml`:

```toml
[[plugin.prepend_previewers]]
mime = "application/bittorrent"
run = "torrent-preview"
```

> [!NOTE]
> Yazi after `v0.4` removes `x-` prefix from subtype, so even if `file -i` outputs `application/x-bittorrent`, you should use `application/bittorrent` ([relevant issue](https://github.com/kirasok/torrent-preview.yazi/issues/2))

