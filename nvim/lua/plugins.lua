return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'


    --- Optimization ---
    use 'lewis6991/impatient.nvim' -- Cache plugin files
    use 'antoinemadec/FixCursorHold.nvim'


    --- Themes ---
    use 'ful1e5/onedark.nvim'
    use 'Shatur/neovim-ayu'
    use 'NTBBloodbath/doom-one.nvim'
    use 'rmehri01/onenord.nvim'
    use 'tiagovla/tokyodark.nvim'
    use 'folke/tokyonight.nvim'
    use {
        "catppuccin/nvim",
        as = "catppuccin",
        config = function()
            require("catppuccin").setup {
                integrations = {
                    which_key = true,
                    telescope = false,
                    lsp_trouble = true
                }
            }
        end
    }


    --- UI ---
    use {
        -- Icons
        'kyazdani42/nvim-web-devicons',
        config = function() require("custom.devicons") end
    }
    use {
        -- Status line
        'nvim-lualine/lualine.nvim',
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function() require("custom.lualine") end
    }

    use {
        -- Starting screen
        'goolord/alpha-nvim',
        config = function() require("custom.alpha") end
    }

    use {
        -- Code diagnostics window
        "folke/trouble.nvim",
        requires = 'kyazdani42/nvim-web-devicons',
        cmd = { "Trouble", "TodoTrouble" },
        config = function()
            require("trouble").setup { use_diagnostic_signs = true }
        end
    }

    use {
        -- Code action menu
        'weilbith/nvim-code-action-menu',
        cmd = "CodeActionMenu",
        config = function()
            vim.g.code_action_menu_show_details = false
            vim.g.code_action_menu_show_diff = false
            vim.g.code_action_menu_window_border = 'solid'
        end
    }

    use {
        -- Highlight todo comments
        "folke/todo-comments.nvim",
        requires = "nvim-lua/plenary.nvim",
        config = function() require("custom.todocomments") end
    }

    use {
        'norcalli/nvim-colorizer.lua',
        config = function()
            require('colorizer').setup {
                "*",
                "!packer",
                css = { names = false, RRGGBBAA = true, css = true }
            }
        end
    }

    use {
        -- Smooth scrolling
        'karb94/neoscroll.nvim',
        config = function() require("custom.neoscroll") end
    }

    use {
        -- Scrollbar
        'petertriho/nvim-scrollbar',
        config = function()
            require("scrollbar").setup {
                handle = { highlight = "CursorLine" },
            }
        end
    }

    use {
        -- Nested mappings with mappings cheatsheet
        "folke/which-key.nvim",
        config = function() require("custom.which-key") end
    }

    use {
        -- Remove buffers without closing windows
        'famiu/bufdelete.nvim',
        cmd = { "Bdelete", "Bdelete!" }
    }

    use {
        -- Tabs
        'akinsho/bufferline.nvim',
        after = "catppuccin",
        tag = "v2.0.0",
        requires = 'kyazdani42/nvim-web-devicons',
        config = function() require("custom.bufferline") end
    }

    use {
        -- Markdown preview
        "ellisonleao/glow.nvim",
        cmd = "Glow",
        config = function()
            require("glow").setup {
                style = "auto", -- "~/Library/Preferences/glow/catppuccin.json"
                border = "solid"
            }
        end
    }

    use {
        -- Markdown live preview in browser
        'iamcco/markdown-preview.nvim',
        run = ":call mkdp#util#install()"
    }


    --- File finders and managers ---
    use {
        -- Native finder for telescope
        'nvim-telescope/telescope-fzf-native.nvim',
        cmd = { "Telescope", "TodoTelescope" },
        run = 'make'
    }

    use {
        -- File browser in telescope
        "nvim-telescope/telescope-file-browser.nvim",
        after = "telescope-fzf-native.nvim"
    }

    use {
        -- Fuzzy finder
        'nvim-telescope/telescope.nvim',
        after = "telescope-file-browser.nvim",
        requires = 'nvim-lua/plenary.nvim',
        config = function() require("custom.telescope") end
    }

    use {
        -- File tree
        'kyazdani42/nvim-tree.lua',
        requires = 'kyazdani42/nvim-web-devicons',
        cmd = {
            'NvimTreeClipboard',
            'NvimTreeClose',
            'NvimTreeFindFile',
            'NvimTreeOpen',
            'NvimTreeRefresh',
            'NvimTreeToggle',
            'NvimTreeFocus',
        },
        config = function() require("custom.nvtree") end
    }


    --- Git ---
    use {
        -- Git integration
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('gitsigns').setup() end
    }

    use {
        -- Cycle through modified files
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewRefresh"
        },
        config = function()
            require("diffview").setup {
                icons = {
                    folder_closed = "",
                    folder_open = "",
                },
                signs = {
                    fold_closed = "",
                    fold_open = "",
                },
                file_panel = {
                    win_config = { width = 30 }
                }
            }
        end
    }


    --- Editor ---
    use {
        -- Surround word with quotes or parentheses
        -- (local copy of blackCauldron7's surround.nvim, original was deleted)
        "~/.config/nvim/localplug/surround.nvim",
        config = function()
            require "surround".setup { mappings_style = "surround" }
        end
    }

    use {
        -- Jump out of quotes and parentheses
        'abecodes/tabout.nvim',
        event = "InsertEnter",
        config = function()
            require('tabout').setup {
                tabouts = {
                    { open = "'", close = "'" },
                    { open = '"', close = '"' },
                    { open = '`', close = '`' },
                    { open = '(', close = ')' },
                    { open = '[', close = ']' },
                    { open = '{', close = '}' },
                    { open = '<', close = '>' },
                },
            }
        end,
        wants = 'nvim-treesitter', -- or require if not used so far
        after = 'nvim-cmp' -- if a completion plugin is using tabs load it before
    }

    use {
        -- Comment lines
        'numToStr/Comment.nvim',
        keys = { { "n", "gc" }, { "v", "gc" }, { "n", "gb" } },
        config = function() require('Comment').setup() end
    }

    use {
        -- Autocomplete quotes and parentheses
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function() require('nvim-autopairs').setup() end
    }

    use {
        -- Alignment by character
        "tommcdo/vim-lion",
        keys = {
            { "n", "gl" },
            { "v", "gl" },
        },
    }

    use "tpope/vim-repeat" -- Repeat more commands with dot


    --- Treesitter ---
    use {
        'nvim-treesitter/nvim-treesitter-textobjects',
        event = { "BufRead", "BufNewFile" },
    }

    use {
        -- Syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        after = "nvim-treesitter-textobjects",
        run = ':TSUpdate',
        config = function() require("custom.treesitter") end
    }

    use {
        -- Indentation lines
        'lukas-reineke/indent-blankline.nvim',
        event = { 'BufRead', 'BufNewFile' },
        config = function()
            require("indent_blankline").setup {
                show_current_context = true,
                show_current_context_start = false,
                filetype_exclude = {
                    "packer",
                    "NvimTree",
                    "Trouble",
                    "alpha",
                    "toggleterm",
                    "terminal",
                    "help"
                }
            }
        end
    }


    --- LSP ---
    use {
        'neovim/nvim-lspconfig',
        config = function() require("custom.lsp") end
    }

    use 'ray-x/lsp_signature.nvim' -- Function arguments floating window

    use {
        -- Code checking utilities integration
        "jose-elias-alvarez/null-ls.nvim",
        requires = 'nvim-lua/plenary.nvim',
        config = function()
            require("custom.nullls")
        end
    }

    use {
        -- Show bulb icon when code action is available
        'kosayoda/nvim-lightbulb',
        after = "nvim-lspconfig",
        config = function()
            vim.api.nvim_create_autocmd({ "CursorHold", "CursorHoldI" }, {
                pattern = "*",
                callback = require('nvim-lightbulb').update_lightbulb,
            })
            require("nvim-lightbulb").setup {
                sign = { enabled = false, },
                virtual_text = { enabled = true, text = "", hl_mode = "replace", }
            }
        end
    }

    use {
        -- LSP loading status (currently disabled)
        'j-hui/fidget.nvim',
        disable = true,
        after = "nvim-lspconfig",
        config = function()
            require("fidget").setup {
                text = {
                    spinner = "dots",
                    done = "",
                },
                timer = {
                    spinner_rate = 80,
                },
                sources = {
                    ["null-ls"] = {
                        ignore = true,
                    }
                }
            }
            vim.cmd [[ hi link FidgetTitle Bold ]]
        end
    }

    --- Completion and snippets ---
    use {
        'rafamadriz/friendly-snippets',
        event = { "InsertEnter", "CmdLineEnter" }
    }
    use {
        'L3MON4D3/LuaSnip',
        after = "friendly-snippets"
    }
    use {
        'hrsh7th/nvim-cmp',
        after = "LuaSnip",
        config = function() require("custom.cmp") end
    }
    use {
        'saadparwaiz1/cmp_luasnip',
        after = "nvim-cmp"
    }
    use {
        'hrsh7th/cmp-nvim-lsp',
        after = "cmp_luasnip"
    }
    use {
        'hrsh7th/cmp-buffer',
        after = "cmp-nvim-lsp"
    }
    use {
        'hrsh7th/cmp-path',
        after = "cmp-buffer"
    }
    use {
        'hrsh7th/cmp-cmdline',
        after = "cmp-path"
    }

    -- use { 'hrsh7th/cmp-nvim-lsp', }
    -- use { 'hrsh7th/cmp-buffer', event = { "InsertEnter", "CmdLineEnter" } }
    -- use { 'hrsh7th/cmp-path', after = "cmp-buffer" }
    -- use { 'hrsh7th/cmp-cmdline', after = "cmp-path" }
    -- use { 'saadparwaiz1/cmp_luasnip', after = "cmp-cmdline" } -- Completion symbols
    -- use { 'L3MON4D3/LuaSnip', after = "cmp_luasnip" }
    -- use { 'rafamadriz/friendly-snippets', after = "LuaSnip" } -- Collection of snippets
    -- use {
    --     'hrsh7th/nvim-cmp',
    --     after = "friendly-snippets",
    --     config = function() require("custom.cmp") end
    -- }


    --- Terminal ---
    use {
        "akinsho/toggleterm.nvim",
        cmd = { "ToggleTerm", "ToggleTermToggleAll" },
        config = function() require("custom.toggleterm") end
    }


    --- Debugging and running ---
    use {
        -- VSCode-like DAP UI
        "rcarriga/nvim-dap-ui",
        cmd = {
            "DapContinue",
            "DapSetLogLevel",
            "DapShowLog",
            "DapStepInto",
            "DapStepOut",
            "DapStepOver",
            "DapTerminate",
            "DapToggleBreakpoint",
            "DapToggleRepl",
        }
    }

    use {
        -- Debug adapter protocol support
        'mfussenegger/nvim-dap',
        after = "nvim-dap-ui",
        config = function() require("custom.dap") end
    }

    use {
        -- Python DAP configurations
        'mfussenegger/nvim-dap-python',
        after = 'nvim-dap',
        ft = 'python',
        config = function()
            require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
        end
    }

    use {
        -- Build and run tasks
        'pianocomposer321/yabs.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        cmd = { "YabsTask", "YabsDefaultTask" },
        config = function() require("custom.yabs") end
    }


    --- Project and session management ---
    use {
        -- Project managment
        "ahmedkhalf/project.nvim",
        config = function()
            require("project_nvim").setup {
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".projectile" },
                detection_methods = { "pattern" },
                silent_chdir = true,
            }
        end
    }

    use {
        -- Session management
        "folke/persistence.nvim",
        event = "BufReadPre",
        module = "persistence",
        config = function() require("persistence").setup() end,
    }
end)
