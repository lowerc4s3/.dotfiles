return {
    -- File tree
    'kyazdani42/nvim-tree.lua',
    dependencies = 'kyazdani42/nvim-web-devicons',
    cmd = {
        'NvimTreeClipboard',
        'NvimTreeClose',
        'NvimTreeFindFile',
        'NvimTreeOpen',
        'NvimTreeRefresh',
        'NvimTreeToggle',
        'NvimTreeFocus',
    },
    opts = {
        hijack_cursor = true,
        respect_buf_cwd = true,
        sync_root_with_cwd = true,
        view = {
            width = 30,
        },
        renderer = {
            root_folder_label = false,
            highlight_git = true,
            full_name = true,
            indent_markers = {
                enable = true,
            },
            icons = {
                symlink_arrow = ' 󰁔 ',
                show = {
                    git = false,
                },
                glyphs = {
                    bookmark = '󰃀',
                    folder = {
                        default      = '󰉋',
                        open         = '󰉋',
                        empty        = '󰉖',
                        empty_open   = '󰉖',
                        symlink      = '󰉒',
                        symlink_open = '󰉒',
                    },
                    git = {
                        unstaged  = '',
                        staged    = '',
                        unmerged  = '󰘬',
                        renamed   = '',
                        untracked = '󰞋',
                        deleted   = '',
                        ignored   = '',
                    },
                },
            },
            special_files = { "makefile" }
        },
        update_focused_file = {
            update_root = true,
        },
        filters = {
            custom = { ".DS_Store" },
        },
        actions = {
            file_popup = {
                open_win_config = {
                    border = "solid",
                },
            },
        },
        trash = {
            cmd = "trash -rf",
        },
        live_filter = {
            prefix = "[󰈶]",
        }
    }
}
