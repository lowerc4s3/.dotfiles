-- Bootstrap lazy.nvim plugin manager
local lazypath = vim.fn.stdpath('data') .. '/lazy/lazy.nvim'
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        'git',
        'clone',
        '--filter=blob:none',
        'https://github.com/folke/lazy.nvim.git',
        '--branch=stable', -- latest stable release
        lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require('lazy').setup({
    'folke/lazy.nvim',

    --- Optimization ---
    -- { 'lewis6991/impatient.nvim',   enabled = false },
    -- 'antoinemadec/FixCursorHold.nvim',

    -- DONE
    --- Themes ---
    { 'ful1e5/onedark.nvim',        lazy = true },
    { 'Shatur/neovim-ayu',          lazy = true },
    { 'NTBBloodbath/doom-one.nvim', lazy = true },
    { 'rmehri01/onenord.nvim',      lazy = true },
    { 'tiagovla/tokyodark.nvim',    lazy = true },
    { 'folke/tokyonight.nvim',      lazy = true },

    {
        'catppuccin/nvim',
        name = 'catppuccin',
        priority = 1000,
        config = function()
            require('custom.catppuccin')
            vim.cmd('colorscheme catppuccin')
        end
    },


    --- UI ---
    -- DONE
    {
        -- Icons
        'kyazdani42/nvim-web-devicons',
        lazy = true,
        config = function() require('custom.devicons') end
    },

    -- DONE
    {
        -- Status line
        'nvim-lualine/lualine.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        config = function() require('custom.lualine') end
    },

    -- DONE
    {
        -- Starting screen
        'goolord/alpha-nvim',
        event = 'VimEnter',
        config = function() require('custom.alpha') end
    },

    {
        -- Code diagnostics window
        'folke/trouble.nvim',
        dependencies = 'kyazdani42/nvim-web-devicons',
        -- cmd = { 'Trouble', 'TroubleToggle', 'TodoTrouble' },
        cmd = { 'Trouble', 'TroubleToggle' },
        opts = {
            use_diagnostic_signs = true
        }
    },

    {
        -- Code action menu
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
        config = function()
            vim.g.code_action_menu_show_details = false
            vim.g.code_action_menu_show_diff = false
            vim.g.code_action_menu_window_border = 'solid'
        end
    },

    {
        -- Highlight todo comments (disabled atm)
        'folke/todo-comments.nvim',
        enabled = false,
        cmd = { 'TodoTrouble', 'TodoTelescope' },
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = 'nvim-lua/plenary.nvim',
        config = function() require('custom.todocomments') end
    },

    {
        -- Highlight color codes like #FFFFFF
        'norcalli/nvim-colorizer.lua',
        event = { 'BufReadPre', 'BufNewFile' },
        opts = {
            '*',
            '!packer',
            '!lazy',
            css = { names = false, RRGGBBAA = true, css = true }
        }
    },

    {
        -- Smooth scrolling
        'karb94/neoscroll.nvim',
        cond = vim.g.neovide, -- Disable if using neovide
        config = function() require('custom.neoscroll') end
    },

    -- DONE
    {
        -- Scrollbar
        'petertriho/nvim-scrollbar',
        opts = {
            handle = {
                highlight = 'CursorLine',
            },
            excluded_filetypes = {
                'NvimTree',
            },
            handlers = {
                cursor = false
            }
        }
    },

    -- DONE
    {
        -- Nested mappings with mappings cheatsheet
        'folke/which-key.nvim',
        config = function() require('custom.wk') end
    },

    {
        -- Remove buffers without closing windows
        'famiu/bufdelete.nvim',
        -- cmd = { 'Bdelete', 'Bdelete!' }
        cmd = 'Bdelete',
    },

    {
        -- Tabs
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        dependencies = {
            'kyazdani42/nvim-web-devicons',
        },
        config = function() require('custom.bufferline') end
    },

    {
        -- Markdown preview
        'ellisonleao/glow.nvim',
        cmd = 'Glow',
        opts = {
            style = 'auto', -- '~/Library/Preferences/glow/catppuccin.json'
            border = 'solid'
        }
    },

    {
        -- Markdown live preview in browser
        'iamcco/markdown-preview.nvim',
        ft = 'markdown',
        build = ':call mkdp#util#install()'
    },

    -- DONE
    {
        -- Native finder for telescope
        'nvim-telescope/telescope-fzf-native.nvim',
        lazy = true,
        build =
        'cmake -S. -Bbuild -DCMAKE_BUILD_TYPE=Release && cmake --build build --config Release && cmake --install build --prefix build',
    },

    -- DONE
    {
        -- Fuzzy finder
        'nvim-telescope/telescope.nvim',
        dependencies = {
            'nvim-lua/plenary.nvim',
            'nvim-lua/popup.nvim',
            'nvim-telescope/telescope-fzf-native.nvim',
            'nvim-telescope/telescope-file-browser.nvim', -- File browser in telescope
            'nvim-telescope/telescope-ui-select.nvim',    -- Telescope picker for vim.ui.select
            'jvgrootveld/telescope-zoxide'                -- Zoxide support
        },
        cmd = { 'Telescope' },
        config = function() require('custom.telescope') end
    },

    -- DONE
    {
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
        config = function() require('custom.nvtree') end
    },


    -- DONE
    --- Git ---
    {
        -- Git integration
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = 'nvim-lua/plenary.nvim',
        config = function() require('gitsigns').setup() end
    },

    {
        -- Cycle through modified files
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        cmd = {
            'DiffviewOpen',
            'DiffviewClose',
            'DiffviewToggleFiles',
            'DiffviewFocusFiles',
            'DiffviewRefresh'
        },
        opts = {
            icons = {
                folder_closed = '󰉋',
                folder_open = '󰉋',
            },
            signs = {
                fold_closed = '',
                fold_open = '',
            },
            file_panel = {
                win_config = { width = 30 }
            }
        },
    },


    --- Editor ---
    {
        -- Surround word with quotes or parentheses
        -- (local copy of blackCauldron7's surround.nvim, original was deleted)
        -- (disabled and replaced with kylechui/nvim-surround)
        dir = '~/.config/nvim/localplug/surround.nvim',
        enabled = false,
        opts = { mappings_style = 'surround' }
    },

    -- DONE
    {
        -- Surround word with quotes or parentheses
        "kylechui/nvim-surround",
        version = "^3.0.0",
        event = "VeryLazy",
        opts = {}
    },

    -- DONE
    {
        "monaqa/dial.nvim",
        keys = {
            { "<C-a>",  function() require("dial.map").manipulate("increment", "normal") end },
            { "<C-x>",  function() require("dial.map").manipulate("decrement", "normal") end },
            { "g<C-a>", function() require("dial.map").manipulate("increment", "gnormal") end },
            { "g<C-x>", function() require("dial.map").manipulate("decrement", "gnormal") end },
            { "<C-a>",  function() require("dial.map").manipulate("increment", "visual") end,  mode = "v" },
            { "<C-x>",  function() require("dial.map").manipulate("decrement", "visual") end,  mode = "v" },
            { "g<C-a>", function() require("dial.map").manipulate("increment", "gvisual") end, mode = "v" },
            { "g<C-x>", function() require("dial.map").manipulate("decrement", "gvisual") end, mode = "v" },
        },
        config = function() require("custom.dial") end
    },

    -- DONE
    {
        -- Enhance w, e, b motions
        -- (disabled atm)
        "chrisgrieser/nvim-spider",
        enabled = false,
        keys = {
            {
                "e",
                "<cmd>lua require('spider').motion('e')<CR>",
                mode = { "n", "o", "x" },
            },
            {
                "w",
                "<cmd>lua require('spider').motion('w')<CR>",
                mode = { "n", "o", "x" },
            },
            {
                "b",
                "<cmd>lua require('spider').motion('b')<CR>",
                mode = { "n", "o", "x" },
            },
            {
                "ge",
                "<cmd>lua require('spider').motion('ge')<CR>",
                mode = { "n", "o", "x" },
            }
        },
    },

    -- DONE
    {
        -- Jump out of quotes and parentheses
        'abecodes/tabout.nvim',
        event = 'InsertEnter',
        opts = {
            tabouts = {
                { open = "'", close = "'" },
                { open = '"', close = '"' },
                { open = '`', close = '`' },
                { open = '(', close = ')' },
                { open = '[', close = ']' },
                { open = '{', close = '}' },
                { open = '<', close = '>' },
            },
        },
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'hrsh7th/nvim-cmp',
        },
    },

    -- DONE
    {
        -- Comment lines (disabled, nvim v.0.10 added commenting)
        'numToStr/Comment.nvim',
        enable = false,
        keys = { { 'gc', mode = { 'n', 'v' } }, { 'gb', mode = { 'n', 'v' } } },
        config = function() require('Comment').setup() end
    },

    -- DONE
    {
        -- Autocomplete quotes and parentheses
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        config = function() require('nvim-autopairs').setup() end
    },

    -- DONE
    {
        -- Alignment by character
        'tommcdo/vim-lion',
        keys = {
            { 'gl', mode = { 'n', 'v' } },
        },
    },

    -- DONE
    {
        -- Repeat more commands with dot
        'tpope/vim-repeat',
        event = 'VeryLazy'
    },


    --- Treesitter ---
    {
        -- Syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'rush-rs/tree-sitter-asm',
            'lukas-reineke/indent-blankline.nvim',
        },
        event = { 'BufReadPost', 'BufNewFile' },
        build = ':TSUpdate',
        config = function() require('custom.treesitter') end
    },

    {
        -- Indentation lines
        'lukas-reineke/indent-blankline.nvim',
        version = '2.20.8',
        -- main = 'ibl',
        -- config = function()
        --     require("ibl").setup {
        --         indent = {
        --             char = '│',
        --         },
        --         scope = {
        --             enabled = true
        --         }
        --     }
        -- end
        opts = {
            show_current_context = true,
            show_current_context_start = false,
            filetype_exclude = {
                'packer',
                'NvimTree',
                'Trouble',
                'alpha',
                'toggleterm',
                'terminal',
                'help'
            }
        }
    },


    --- LSP ---
    {
        'neovim/nvim-lspconfig',
        -- event = { 'BufReadPre', 'BufNewFile' },
        config = function() require('custom.lsp') end
    },

    'ray-x/lsp_signature.nvim', -- Function arguments floating window

    {
        "rachartier/tiny-inline-diagnostic.nvim",
        event = "LspAttach",
        priority = 1000,
        opts = {
            preset = "simple",
            options = {
                multilines = {
                    enabled = true
                }
            }
        }
    },

    {
        -- Clangd extensions support
        -- (disabled atm)
        'p00f/clangd_extensions.nvim',
        enabled = false,
        dependencies = {
            'neovim/nvim-lspconfig',
        },
        -- ft = { 'c', 'cpp' },
        config = function()
            require('custom.lsp.clangd')
        end
    },

    {
        "ray-x/go.nvim",
        dependencies = {
            "ray-x/guihua.lua",
            "nvim-treesitter/nvim-treesitter",
        },
        config = function()
            require("go").setup()
        end,
        ft = { "go", 'gomod' },
        build = ':lua require("go.install").update_all_sync()' -- if you need to install/update all binaries
    },

    {
        -- Code checking utilities integration
        -- (disabled atm)
        -- NOTE: change to none-ls in case null-ls is needed
        'jose-elias-alvarez/null-ls.nvim',
        enabled = false,
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = 'nvim-lua/plenary.nvim',
        config = function()
            require('custom.nullls')
        end
    },

    {
        -- Show bulb icon when code action is available
        'kosayoda/nvim-lightbulb',
        dependencies = 'neovim/nvim-lspconfig',
        config = function()
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                pattern = '*',
                callback = require('nvim-lightbulb').update_lightbulb,
            })
            require('nvim-lightbulb').setup {
                sign = { enabled = false, },
                virtual_text = { enabled = true, text = '', hl_mode = 'replace', }
            }
        end
    },

    {
        -- Tree-like view for symbols
        'simrat39/symbols-outline.nvim',
        dependencies = 'neovim/nvim-lspconfig',
        cmd = 'SymbolsOutline',
        config = function()
            require('custom.symbols-outline')
        end
    },

    {
        -- LSP loading status (disabled atm)
        'j-hui/fidget.nvim',
        enabled = false,
        dependencies = 'nvim-lspconfig',
        config = function()
            require('fidget').setup {
                text = {
                    spinner = 'dots',
                    done = '󰄬',
                },
                timer = {
                    spinner_rate = 80,
                },
                sources = {
                    ['null-ls'] = {
                        ignore = true,
                    }
                }
            }
            vim.cmd [[ hi link FidgetTitle Bold ]]
        end
    },

    {
        -- VS Code like winbar
        'utilyre/barbecue.nvim',
        dependencies = 'SmiteshP/nvim-navic',
        opts = {
            show_dirname = true,
            show_basename = true,
            show_modified = true,
            symbols = { modified = '󰆓', },
            exclude_filetypes = { "toggleterm", "terminal" },
        }
    },


    --- Completion and snippets ---
    {
        -- Completion engine
        'hrsh7th/nvim-cmp',
        dependencies = {
            'rafamadriz/friendly-snippets', -- General snippet collection
            'L3MON4D3/LuaSnip',             -- Snippet engine
            'saadparwaiz1/cmp_luasnip',     -- luasnip support
            'hrsh7th/cmp-nvim-lsp',         -- lsp support
            'hrsh7th/cmp-buffer',           -- autocomplete from text
            'hrsh7th/cmp-path',             -- path autocompletion
            'hrsh7th/cmp-cmdline',          -- cmdline autocompletion
        },
        event = { 'InsertEnter', 'CmdLineEnter' },
        config = function() require('custom.cmp') end
    },

    {
        -- Snippet engine
        'L3MON4D3/LuaSnip',
        build = "make install_jsregexp",
    },

    --- Terminal ---
    {
        'akinsho/toggleterm.nvim',
        cmd = { 'ToggleTerm', 'ToggleTermToggleAll' },
        config = function() require('custom.toggleterm') end
    },


    --- Debugging and building ---
    {
        -- Debug adapter protocol support
        'mfussenegger/nvim-dap',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'rcarriga/nvim-dap-ui', -- VSCode-like DAP UI
        },
        cmd = {
            'CMakeDebug',
            'DapContinue',
            'DapSetLogLevel',
            'DapShowLog',
            'DapStepInto',
            'DapStepOut',
            'DapStepOver',
            'DapTerminate',
            'DapToggleBreakpoint',
            'DapToggleRepl',
        },
        after = 'nvim-dap-ui',
        config = function() require('custom.dap') end
    },

    {
        -- Python DAP configurations
        'mfussenegger/nvim-dap-python',
        dependencies = 'mfussenegger/nvim-dap',
        ft = 'python',
        config = function()
            require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
        end
    },

    {
        -- CMake integration
        'Civitasv/cmake-tools.nvim',
        cmd = {
            'CMakeGenerate',
            'CMakeBuild',
            'CMakeRun',
            'CMakeDebug',
            'CMakeSelectBuildType',
            'CMakeSelectBuildTarget',
            'CMakeSelectLaunchTarget',
            'CMakeSelectKit',
            'CMakeSelectConfigurePreset',
            'CMakeSelectBuildPreset',
            'CMakeOpen',
            'CMakeClose',
            'CMakeInstall',
            'CMakeClean',
            'CMakeStop',
        },
        opts = {
            cmake_command = 'cmake',
            cmake_build_directory = 'build',
            cmake_build_directory_prefix = '',
            cmake_generate_options = { '-D', 'CMAKE_EXPORT_COMPILE_COMMANDS=1', '-D', 'CMAKE_CXX_COMPILER=clang++' },
            cmake_soft_link_compile_commands = true,
            cmake_build_options = {},
            cmake_console_size = 10,
            cmake_console_position = 'belowright',
            cmake_show_console = 'always',
            cmake_dap_configuration = { name = 'cpp', type = 'lldb', request = 'launch' },
            cmake_variants_message = {
                short = { show = true },
                long = { show = true, max_length = 40 }
            }
        }
    },


    --- Project and session management ---
    {
        -- Project managment
        'ahmedkhalf/project.nvim',
        config = function()
            require('project_nvim').setup {
                patterns = { '.git', '_darcs', '.hg', '.bzr', '.svn', 'Makefile', 'package.json', 'CMakeLists.txt',
                    '.projectile' },
                detection_methods = { 'lsp', 'pattern' },
                -- silent_chdir = true,
            }
        end
    },

    {
        -- Session management
        'folke/persistence.nvim',
        event = 'BufReadPre',
        config = function() require('persistence').setup() end,
    },

    install = { colorscheme = "catppuccin" }
})
