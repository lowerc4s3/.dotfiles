require'nvim-tree'.setup {
    respect_buf_cwd = true,
    auto_reload_on_write = true,
    disable_netrw = false,
    hijack_cursor = true,
    hijack_netrw = true,
    hijack_unnamed_buffer_when_opening = false,
    ignore_buffer_on_setup = false,
    open_on_setup = false,
    open_on_setup_file = false,
    open_on_tab = false,
    sort_by = "name",
    update_cwd = true,
    -- icons = ,
    view = {
        width = 28,
        height = 30,
        side = "left",
        preserve_window_proportions = false,
        number = false,
        relativenumber = false,
        signcolumn = "yes",
        hide_root_folder = true,
    },
    renderer = {
        root_folder_modifier = ':e',
        indent_markers = {
            enable = true,
            icons = {
                corner = "└ ",
                edge = "│ ",
                none = "  ",
            },
        },
        icons = {
            padding = ' ',
            symlink_arrow = '  ',
            glyphs = {
                ['default'] = '', --
                ['symlink'] = '',
                ['git'] = {
                    ['unstaged']  = "",
                    ['staged']    = "", --
                    ['unmerged']  = "שׂ",
                    ['renamed']   = "", --
                    ['untracked'] = "ﲉ",
                    ['deleted']   = "",
                    ['ignored']   = "" --◌
                },
                ['folder'] = {
                    ['arrow_open']   = "", -- 
                    ['arrow_closed'] = "", -- 
                    ['default']      = "",
                    ['open']         = "",
                    ['empty']        = "",
                    ['empty_open']   = "",
                    ['symlink']      = "",
                    ['symlink_open'] = "",
                }
            }
        }
    },
    hijack_directories = {
        enable = true,
        auto_open = true,
    },
    update_focused_file = {
        enable = false,
        update_cwd = true,
        ignore_list = {},
    },
    ignore_ft_on_setup = {},
    filters = {
        dotfiles = false,
        custom = { ".DS_Store" },
        exclude = {},
    },
    filesystem_watchers = {
        enable = true,
        debounce_delay = 100,
        -- interval = 100,
    },
    actions = {
        use_system_clipboard = true,
        change_dir = {
            enable = true,
            global = false,
        },
        open_file = {
            quit_on_open = false,
            resize_window = false,
            window_picker = {
                enable = true,
                chars = "ABCDEFGHIJKLMNOPQRSTUVWXYZ1234567890",
                exclude = {
                    filetype = { "notify", "packer", "qf", "diff", "fugitive", "fugitiveblame" },
                    buftype = { "nofile", "terminal", "help" },
                },
            },
        },
    },
    trash = {
        cmd = "trash -rf",
        require_confirm = true,
    },
    live_filter = {
        -- prefix = "[FILTER]: ",
        prefix = "[] ",
        always_show_folders = true,
    },
}
