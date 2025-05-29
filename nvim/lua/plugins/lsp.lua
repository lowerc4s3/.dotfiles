return {
    {
        -- LSP client configurations
        'neovim/nvim-lspconfig',
        lazy = false,
    },

    {
        -- External tooling installer
        "mason-org/mason.nvim",
        opts = {}
    },

    {
        -- Function arguments floating window
        'ray-x/lsp_signature.nvim',
        event = "InsertEnter",
        opts = {
            hint_enable = false,
            handler_opts = {
                border = "none"
            }
        }
    },

    {
        -- Improved virtual text diagnostic messages
        "rachartier/tiny-inline-diagnostic.nvim",
        opts = {
            preset = "simple",
            options = {
                multilines = {
                    enabled = true
                },
            }
        }
    },

    {
        -- Better Golang support (disabled atm)
        "ray-x/go.nvim",
        enabled = false,
        build = function() require("go.install").update_all_sync() end, -- if you need to install/update all binaries
        dependencies = {
            "ray-x/guihua.lua",
            "nvim-treesitter/nvim-treesitter",
        },
        ft = { "go", 'gomod' },
        opts = {
            disable_defaults = true,
            go = 'go',
            -- HACK: With disabled defaults plugin throws error about empty preludes,
            -- so we set it as in default config
            preludes = {
                default = function()
                    return {}
                end,
                GoRun = function()
                    return {}
                end,
            }
        },
    },

    {
        -- Show bulb icon when code action is available
        'kosayoda/nvim-lightbulb',
        event = "LspAttach",
        opts = {
            sign = { enabled = false, },
            virtual_text = { enabled = true, text = '', hl_mode = 'replace', },
            autocmd = {
                enabled = true,
                updatetime = -1, -- Disable setting updatetime
            }
        },
    },

    {
        -- Tree-like view for symbols
        "hedyhli/outline.nvim",
        cmd = { "Outline", "OutlineOpen" },
        opts = {
            outline_window = {
                width = 33,
                auto_jump = true,
            },
            symbols = {
                icons = {
                    -- TODO: Move kind icons into separate module
                    File = { icon = "", hl = "@text.uri" },
                    Module = { icon = "", hl = "@namespace" },
                    Namespace = { icon = "", hl = "@namespace" },
                    Package = { icon = "", hl = "@namespace" },
                    Class = { icon = "", hl = "@type" },
                    Method = { icon = "", hl = "@method" },
                    Property = { icon = "", hl = "@method" },
                    Field = { icon = "", hl = "@field" },
                    Constructor = { icon = "", hl = "@constructor" },
                    Enum = { icon = "", hl = "@type" },
                    Interface = { icon = "", hl = "@type" },
                    Function = { icon = "", hl = "@function" },
                    Variable = { icon = "", hl = "@constant" },
                    Constant = { icon = "", hl = "@constant" },
                    String = { icon = "", hl = "@string" },
                    Number = { icon = "󰎠", hl = "@number" },
                    Boolean = { icon = "", hl = "@boolean" },
                    Array = { icon = "", hl = "@constant" },
                    Object = { icon = "⦿", hl = "@type" },
                    Key = { icon = "󰌆", hl = "@type" },
                    Null = { icon = "", hl = "@type" },
                    EnumMember = { icon = "", hl = "@field" },
                    Struct = { icon = "", hl = "@type" },
                    Event = { icon = "", hl = "@type" },
                    Operator = { icon = "", hl = "@operator" },
                    TypeParameter = { icon = "𝙏", hl = "@parameter" },
                    Component = { icon = "󰅴", hl = "@function" },
                    Fragment = { icon = "󰅴", hl = "@constant" },
                }
            }
        }
    },

    {
        -- Language server loading status (disabled atm)
        'j-hui/fidget.nvim',
        enabled = false,
        opts = {
            progress = {
                display = {
                    done_icon = "󰄬",
                    progress_icon = { "dots" },
                }
            }
        }
    },

    {
        -- VS Code like winbar
        -- TODO: Look for alternatives (repo archived)
        'utilyre/barbecue.nvim',
        enabled = false,
        dependencies = 'SmiteshP/nvim-navic',
        opts = {
            show_dirname = true,
            show_basename = true,
            show_modified = true,
            symbols = { modified = '󰆓', },
            exclude_filetypes = { "toggleterm", "terminal" },
        }
    },

    {
        -- Code diagnostics window
        'folke/trouble.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        cmd = 'Trouble',
        opts = {
            use_diagnostic_signs = true,
        }
    },

    {
        -- Code action menu with preview
        -- (disabled atm)
        "rachartier/tiny-code-action.nvim",
        enabled = false,
        dependencies = {
            "nvim-lua/plenary.nvim",
            "nvim-telescope/telescope.nvim",
        },
        event = "LspAttach",
        opts = {
            backend = "delta",
            picker = "telescope",
            backend_opts = {
                delta = {
                    header_lines_to_remove = 4
                }
            }
        },
    },

    {
        -- Pretty hover formatting
        "Fildo7525/pretty_hover",
        enabled = false,
        event = "LspAttach",
        lazy = true,
        opts = {}
    },

    -- JSON schemas catalog
    "b0o/schemastore.nvim",

    {
        -- LuaLS config for Neovim
        "folke/lazydev.nvim",
        ft = "lua",
        opts = {
            library = {
                { path = "${3rd}/luv/library", words = { "vim%.uv" } },
            },
        },
    }
}
