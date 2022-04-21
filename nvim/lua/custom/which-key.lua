require("which-key").setup {
    plugins = {
        presets = {
            operators = false, -- adds help for operators like d, y, ... and registers them for motion / text object completion
            motions = false, -- adds help for motions
            text_objects = false, -- help for text objects triggered after entering an operator
            windows = false, -- default bindings on <c-w>
            nav = false, -- misc bindings to work with windows
            z = true, -- bindings for folds, spelling and others prefixed with z
            g = true, -- bindings for prefixed with g
        },
    },

    key_labels = {
        -- override the label used to display some keys. It doesn't effect WK in any other way.
        ["<space>"] = " SPC",
        ["<leader>"] = "SPC",
        ["<cr>"] = " RET",
        ["<tab>"] = " TAB",
    },

    icons = {
        breadcrumb = "»", -- symbol used in the command line area that shows your active key combo
        -- separator = "", -- symbol used between a key and it's label
        separator = "│", -- symbol used between a key and it's label
        group = "", -- symbol prepended to a group
        -- group = "+", -- symbol prepended to a group
    },

    window = {
        border = "none", -- none, single, double, shadow
        position = "bottom", -- bottom, top
        margin = { 1, 0, 1, 0 }, -- extra window margin [top, right, bottom, left]
        padding = { 1, 1, 1, 1 }, -- extra window padding [top, right, bottom, left]
        winblend = 0
    },

    layout = {
        height = { min = 4, max = 25 }, -- min and max height of the columns
        width = { min = 20, max = 50 }, -- min and max width of the columns
        spacing = 8, -- spacing between columns
        align = "left", -- align columns left, center or right
    },

    show_help = true,
}

require("custom.wk_mappings")
