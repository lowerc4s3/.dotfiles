local telescope = require("telescope")
local actions = require("telescope.actions")
local fb_actions = require("telescope").extensions.file_browser.actions

telescope.setup {
    defaults = {
        -- layout_config = {width = 0.75, prompt_position = "top", preview_cutoff = 120, horizontal = {mirror = false}, vertical = {mirror = true}},
        prompt_prefix = "> ", -- 
        selection_caret = " ", --❯
        entry_prefix = "  ",
        scroll_strategy = "limit",
        -- border = false,
        -- borderchars = { "─", "│", "─", "│", "╭", "╮", "╯", "╰" },
        -- borderchars = {" ", " ", " ", " ", " ", " ", " ", " " },

        mappings = {
            i = {
                ["<C-j>"]   = actions.move_selection_next,
                ["<C-k>"]   = actions.move_selection_previous,
                -- ["<tab>"]   = actions.move_selection_next,
                -- ["<S-tab>"] = actions.move_selection_previous,
                ["<tab>"]   = actions.select_default,
                ["<esc>"]   = actions.close,
            }
        }
    },

    pickers = {
        find_files = { theme = "ivy" },
        oldfiles = { theme = "ivy" },
        live_grep = { theme = "ivy" },
        buffers = { theme = "ivy" },
    },

    extensions = {
        file_browser = {
            theme = "ivy",
            mappings = {
                i = {
                    ["<C-a>"]   = fb_actions.create,
                    ["<C-r>"]   = fb_actions.rename,
                    ["<C-d>"]   = fb_actions.remove,
                    ["["]       = fb_actions.goto_parent_dir,
                    ["<C-.>"]   = fb_actions.change_cwd,
                    ["<tab>"]   = actions.select_default,
                    -- ["<esc>"] = false,
                }
            }
        },
    }
}
-- h ttyfast
telescope.load_extension("projects")
telescope.load_extension("fzf")
telescope.load_extension("file_browser")
