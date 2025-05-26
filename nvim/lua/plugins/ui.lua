return {
    {
        -- Scrollbar
        'petertriho/nvim-scrollbar',
        opts = {
            handle = {
                highlight = 'CursorLine',
            },
            excluded_filetypes = {
                'NvimTree',
                'noice',
            },
            handlers = {
                cursor = false
            }
        }
    },

    {
        -- General UI replacements
        "folke/noice.nvim",
        dependencies = {
            "MunifTanjim/nui.nvim",
            {
                -- Notification manager
                "rcarriga/nvim-notify",
                opts = {
                    on_open = function(win)
                        local config = vim.api.nvim_win_get_config(win)
                        config.border = "single"
                        vim.api.nvim_win_set_config(win, config)
                    end,
                    stages = "fade",
                    icons = {
                        ERROR = "",
                        WARN = "",
                        INFO = "󰋽",
                        DEBUG = "",
                        TRACE = "󰭰",
                    }
                }
            },
        },
        opts = {
            cmdline = {
                view = "cmdline",
                format = {
                    cmdline = { pattern = "^:", icon = "", lang = "vim" },
                    search_down = { kind = "search", pattern = "^/", icon = "", lang = "regex" },
                    search_up = { kind = "search", pattern = "^%?", icon = "", lang = "regex" },
                    filter = { pattern = "^:%s*!", icon = "$", lang = "bash" },
                    lua = { pattern = { "^:%s*lua%s+", "^:%s*lua%s*=%s*", "^:%s*=%s*" }, icon = "", lang = "lua" },
                    help = false,
                    input = { view = "cmdline_input", icon = "" },
                }
            },
            lsp = {
                progress = {
                    format_done = {
                        { "󰄬 ", hl_group = "NoiceLspProgressSpinner" },
                        { "{data.progress.title} ", hl_group = "NoiceLspProgressTitle" },
                        { "{data.progress.client} ", hl_group = "NoiceLspProgressClient" },
                    }
                },
                signature = {
                    enabled = false,
                },
                hover = {
                   enabled = false,
                },
            },
        }
    },

    {
        -- Smooth scrolling in terminal nvim
        'karb94/neoscroll.nvim',
        cond = vim.g.neovide ~= true, -- Disable if using neovide
        keys = {
            { "<C-u>", function() require("neoscroll").ctrl_u({ duration = 100 }) end,                            mode = { 'n', 'v', 'x' } },
            { "<C-d>", function() require("neoscroll").ctrl_d({ duration = 100 }) end,                            mode = { 'n', 'v', 'x' } },
            { "<C-b>", function() require("neoscroll").ctrl_b({ duration = 100 }) end,                            mode = { 'n', 'v', 'x' } },
            { "<C-f>", function() require("neoscroll").ctrl_f({ duration = 100 }) end,                            mode = { 'n', 'v', 'x' } },
            { "<C-y>", function() require("neoscroll").scroll(-0.1, { move_cursor = false, duration = 100 }) end, mode = { 'n', 'v', 'x' } },
            { "<C-e>", function() require("neoscroll").scroll(0.1, { move_cursor = false, duration = 100 }) end,  mode = { 'n', 'v', 'x' } },
            { "zt",    function() require("neoscroll").zt({ half_win_duration = 150 }) end,                       mode = { 'n', 'v', 'x' } },
            { "zz",    function() require("neoscroll").zz({ half_win_duration = 150 }) end,                       mode = { 'n', 'v', 'x' } },
            { "zb",    function() require("neoscroll").zb({ half_win_duration = 150 }) end,                       mode = { 'n', 'v', 'x' } },
        },
        opts = {
            hide_cursor = false,
            easing_function = "circular",
            mappings = {} -- Disable default mappings as we define custom in keys
        }
    },

    {
        -- Highlight todo comments
        'folke/todo-comments.nvim',
        cmd = { 'TodoTrouble', 'TodoTelescope' },
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {
            signs = false,
            keywords = {
                FIX  = { icon = " ", color = "error", alt = { "FIXME", "BUG", "FIXIT", "ISSUE" } },
                TODO = { icon = " ", color = "info" },
                HACK = { icon = " ", color = "warning" },
                WARN = { icon = " ", color = "warning", alt = { "WARNING", "XXX" } },
                PERF = { icon = "󰅒 ", alt = { "OPTIM", "PERFORMANCE", "OPTIMIZE" } },
                NOTE = { icon = "󰍨 ", color = "hint", alt = { "INFO" } },
            },
        }
    },

    {
        -- Highlight color codes
        'catgoose/nvim-colorizer.lua',
        event = "VeryLazy",
        opts = {
            user_default_options = {
                names = false,
                mode = "virtualtext",
                virtualtext = "",
                virtualtext_inline = true,
            },
            css = { css = true }
        }
    },

    {
        -- Dashboard from snacks
        "folke/snacks.nvim",
        opts = {
            dashboard = {
                preset = {
                    keys = {
                        { key = "n", icon = "󰈙", desc = "New file", action = ":enew" },
                        { key = "f", icon = "󰈞", desc = "Find file", action = ":Telescope find_files" },
                        { key = "r", icon = "󰥔", desc = "Recent files", action = ":Telescope oldfiles" },
                        { key = "d", icon = "", desc = "Browse files", action = ":Telescope file_browser" },
                        { key = "p", icon = "", desc = "Open project", action = ":Telescope projects" },
                        {
                            key = "z",
                            icon = "󰉒",
                            desc = "Change directory",
                            action = function()
                                require("telescope").extensions.zoxide.list()
                            end
                        },
                        {
                            key = "l",
                            icon = "󰁯",
                            desc = "Load last session",
                            action = function()
                                require("persistence").load { last = true }
                            end
                        },
                        { key = "q", icon = "󰅗", desc = "Quit", action = ":qa!" },
                    }
                },
                formats = {
                    desc = { "%s", hl = "Comment" },
                    key = { "%s ", hl = "lualine_b_visual" },
                    icon = { "%s", hl = "Comment" }
                },
                sections = {
                    {
                        section = "terminal",
                        cmd = "chafa ~/dots/assets/lain_sq.jpeg -f symbols --symbols vhalf -s 37x12 --stretch; sleep .1",
                        height = 12,
                        width = 37,
                        padding = 1,
                        align = "center",
                        indent = 12
                    },
                    {
                        section = "keys",
                        gap = 1,
                        padding = 1
                    }
                }
            }
        }
    },

    {
        -- Prettier quickfix window
        "yorickpeterse/nvim-pqf",
        main = "pqf",
        opts = {}
    }
}
