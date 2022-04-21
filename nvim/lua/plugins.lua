--------------------------------------------------------------------------------------
---- Remember ro run :PackerCompile or :PackerSync after modifying configuratuion ----
--------------------------------------------------------------------------------------

-- Plugin list
return require('packer').startup(function(use)
    use 'wbthomason/packer.nvim'

    --- Optimization plugins ---
    use 'lewis6991/impatient.nvim' -- Cache plugin files
    use 'antoinemadec/FixCursorHold.nvim'

    --- Themes ---
    -- use 'ful1e5/onedark.nvim'
    -- use 'Shatur/neovim-ayu'
    -- use 'NTBBloodbath/doom-one.nvim'
    -- use 'rmehri01/onenord.nvim'
    -- use 'tiagovla/tokyodark.nvim'
    -- use 'folke/tokyonight.nvim'
    use { "catppuccin/nvim", as = "catppuccin" }

    --- UI ---
    use {
        'nvim-lualine/lualine.nvim', -- Status line
        requires = { 'kyazdani42/nvim-web-devicons' },
        config = function() require("custom.lualine") end
    }

    use {
        'goolord/alpha-nvim', -- Starting screen
        config = function () require("custom.alpha") end
    }

    use {
        "folke/persistence.nvim", -- Session management
        event = "BufReadPre",
        module = "persistence",
        config = function() require("persistence").setup() end,
    }

    use {
        "folke/which-key.nvim", -- Nested mappings with mappings cheatsheet
        config = function() require("custom.which-key") end
    }

    use {
        "folke/trouble.nvim", -- Code diagnostics window
        requires = 'kyazdani42/nvim-web-devicons',
        cmd = "Trouble",
        config = function()
            require("trouble").setup { use_diagnostic_signs = true }
        end
    }

    use {
        'karb94/neoscroll.nvim', -- Smooth scrolling
        config = function () require("custom.neoscroll") end
    }

    use {
        'petertriho/nvim-scrollbar', -- Scrollbar
        config = function ()
            require("scrollbar").setup {
                handle = { highlight = "CursorLine" }
            }
        end
    }

    use {
        'kyazdani42/nvim-tree.lua', -- File tree
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

    use {
        'akinsho/bufferline.nvim', -- Tabs
        requires = 'kyazdani42/nvim-web-devicons',
        config = function () require("custom.bufferline") end
    }

    use 'famiu/bufdelete.nvim' -- Remove buffers without closing windows

    use {
        'nvim-telescope/telescope-fzf-native.nvim',
        cmd = "Telescope",
        run = 'make'
    }

    use {
        "nvim-telescope/telescope-file-browser.nvim", -- File browser in telescope
        after = "telescope-fzf-native.nvim"
    }

    use {
        'nvim-telescope/telescope.nvim', -- Fuzzy finder
        after = "telescope-file-browser.nvim",
        requires = 'nvim-lua/plenary.nvim',
        config = function () require("custom.telescope") end
    }

    use {
        "akinsho/toggleterm.nvim", -- Terminal
        cmd = { "ToggleTerm", "ToggleTermToggleAll" },
        config = function () require("custom.toggleterm") end
    }

    -- use {
    --     "folke/todo-comments.nvim", -- Highlight todo comments
    --     event = "BufEnter",
    --     requires = "nvim-lua/plenary.nvim",
    --     config = function() require("custom.todocomments") end
    -- }

    use {
        'lewis6991/gitsigns.nvim',
        requires = 'nvim-lua/plenary.nvim',
        config = function() require('gitsigns').setup() end
    }

    use {
        'sindrets/diffview.nvim',
        requires = 'nvim-lua/plenary.nvim',
        cmd = {
            "DiffviewOpen",
            "DiffviewClose",
            "DiffviewToggleFiles",
            "DiffviewFocusFiles",
            "DiffviewRefresh"
        },
        config = function ()
            require("diffview").setup {
                icons = {
                    folder_closed = "",
                    folder_open = "",
                },
                signs = {
                    fold_closed = "",
                    fold_open = "",
                },
                file_panel = { width = 30 }
            }
        end
    }

    --- Editor ---
    use {
        "ahmedkhalf/project.nvim", -- Project managment
        config = function()
            require("project_nvim").setup {
                patterns = { ".git", "_darcs", ".hg", ".bzr", ".svn", "Makefile", "package.json", ".projectile" },
                detection_methods = { "pattern" },
                silent_chdir = false,
            }
        end
    }

    use {
        "blackCauldron7/surround.nvim", -- Surround word with quotes or parentheses
        event = 'BufEnter',
        config = function() require"surround".setup { mappings_style = "surround" } end
    }

    use {
        'abecodes/tabout.nvim', -- Jump out of quotes and parentheses
        config = function()
            require('tabout').setup {
                tabouts = {
                    {open = "'", close = "'"},
                    {open = '"', close = '"'},
                    {open = '`', close = '`'},
                    {open = '(', close = ')'},
                    {open = '[', close = ']'},
                    {open = '{', close = '}'},
                    {open = '<', close = '>'},
                },
            }
        end,
        wants = 'nvim-treesitter', -- or require if not used so far
        after = 'nvim-cmp' -- if a completion plugin is using tabs load it before
    }

    use {
        'numToStr/Comment.nvim', -- Comment lines
        keys = { {"n", "gc"}, {"v", "gc"} },
        config = function() require('Comment').setup() end
    }

    use {
        'lukas-reineke/indent-blankline.nvim' , -- Indentation lines
        event = 'BufEnter',
        config = function ()
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

    use {
        'windwp/nvim-autopairs', -- Autocomplete quotes and parentheses
        event = 'InsertEnter',
        config = function () require('nvim-autopairs').setup() end
    }

    use {
        "tommcdo/vim-lion", -- Alignment by character
        keys = {
            {"n", "gl"},
            {"v", "gl"},
        },
    }

    use "tpope/vim-repeat" -- Repeat more commands with dot

    --- LSP ---
    use 'ray-x/lsp_signature.nvim' -- Function arguments floating window

    use {
        'neovim/nvim-lspconfig',
        after = "lsp_signature.nvim",
        config = function () require("lspconf") end
    }

    use {
        "jose-elias-alvarez/null-ls.nvim",
        requires = 'nvim-lua/plenary.nvim',
        config = function ()
            require("custom.nullls")
        end
    }

    use {
        'kosayoda/nvim-lightbulb',
        after = "nvim-lspconfig",
        config = function ()
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

    --- Treesitter ---
    use {
        'nvim-treesitter/nvim-treesitter', -- Syntax highlighting
        run = ':TSUpdate',
        config = function () require("custom.treesitter") end
    }

    use 'nvim-treesitter/nvim-treesitter-textobjects' -- Treesitter textobjects

    --- Completion and snippets ---
    use { 'hrsh7th/cmp-nvim-lsp',}
    use { 'hrsh7th/cmp-buffer', event = { "InsertEnter", "CmdLineEnter" } }
    use { 'hrsh7th/cmp-path', after = "cmp-buffer" }
    use { 'hrsh7th/cmp-cmdline', after = "cmp-path" }
    use { 'onsails/lspkind-nvim', after = "cmp-cmdline" }
    use { 'saadparwaiz1/cmp_luasnip',after = "lspkind-nvim" } -- Completion symbols
    use { 'L3MON4D3/LuaSnip', after = "cmp_luasnip" } -- Collection of snippets
    use { 'rafamadriz/friendly-snippets', after = "LuaSnip" }
    use {
        'hrsh7th/nvim-cmp',
        after = "friendly-snippets",
        config = function() require("custom.cmp") end
    }

    --- Code runner ---
    use {
        'pianocomposer321/yabs.nvim',
        requires = { 'nvim-lua/plenary.nvim' },
        branch = 'hotfix',
        cmd = { "YabsTask", "YabsDefaultTask" },
        config = function () require("custom.yabs") end
    }

    use {
        "ellisonleao/glow.nvim",
        cmd = "Glow",
        config = function ()
            vim.g.glow_style = "~/Library/Preferences/glow/catppuccin.json"
            vim.g.glow_border = "rounded"
        end
    }

    --- Debug ---
    use {
        'mfussenegger/nvim-dap',
        config = function () require("dapconf") end
    }
    use {
        'mfussenegger/nvim-dap-python', -- Python DAP configurations
        after = 'nvim-dap',
        ft = 'python',
        config = function ()
            require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
        end
    }
    use { "rcarriga/nvim-dap-ui" } -- VSCode-like DAP UI
end)
