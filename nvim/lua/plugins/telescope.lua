return {
    -- Fuzzy finder
    'nvim-telescope/telescope.nvim',
    version = false,
    cmd = 'Telescope',
    dependencies = {
        'nvim-lua/plenary.nvim',
        'nvim-lua/popup.nvim',
        'nvim-telescope/telescope-file-browser.nvim', -- File browser in telescope
        'nvim-telescope/telescope-ui-select.nvim',    -- Telescope picker for vim.ui.select
        'jvgrootveld/telescope-zoxide',               -- Zoxide support
        {
            -- Native finder implemetation for telescope
            'nvim-telescope/telescope-fzf-native.nvim',
            lazy = true,
            build = 'make',
        }
    },
    opts = function()
        local actions = require("telescope.actions")
        local fb_actions = require("telescope").extensions.file_browser.actions

        return {
            defaults = {
                initial_mode = 'insert',
                prompt_prefix = "  ",
                selection_caret = " ",
                entry_prefix = " ",
                scroll_strategy = "limit",
                sorting_strategy = "ascending",
                results_title = false,
                borderchars = { " ", " ", " ", " ", " ", " ", " ", " " },
                layout_strategy = "horizontal",
                -- layout_strategy = "bottom_pane",
                layout_config = {
                    prompt_position = 'top',
                    horizontal = {
                        -- anchor = "S",
                        -- width = vim.o.columns,
                        -- height = 0.6,
                        preview_width = 0.5,
                    },
                },
                mappings = {
                    i = {
                        ["<C-j>"] = actions.move_selection_next,
                        ["<C-k>"] = actions.move_selection_previous,
                        ["<tab>"] = actions.select_default,
                        ["<esc>"] = actions.close,
                    }
                }
            },

            extensions = {
                file_browser = {
                    mappings = {
                        i = {
                            ["<C-a>"] = fb_actions.create,
                            ["<C-r>"] = fb_actions.rename,
                            ["<C-d>"] = fb_actions.remove,
                            ["["]     = fb_actions.goto_parent_dir,
                            ["<C-.>"] = fb_actions.change_cwd,
                            ["<tab>"] = actions.select_default,
                        }
                    }
                },
                ["ui-select"] = {
                    layout_strategy = "bottom_pane",
                    layout_config = {
                        height = 10,
                    },
                    codeactions = false,
                },
                zoxide = {
                    mappings = {
                        ["<C-b>"] = {
                            keepinsert = true,
                            action = function(selection)
                                require("telescope").extensions.file_browser.file_browser({ cwd = selection.path })
                            end
                        },
                    }
                }
            }
        }
    end,
    config = function(_, opts)
        local telescope = require("telescope")
        telescope.setup(opts)

        telescope.load_extension("fzf")
        telescope.load_extension("file_browser")
        telescope.load_extension("ui-select")
        telescope.load_extension("zoxide")
    end
}
