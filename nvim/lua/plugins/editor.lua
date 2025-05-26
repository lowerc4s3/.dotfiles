return {
    {
        -- Surround word with quotes or parentheses
        "kylechui/nvim-surround",
        version = "^3.0.0",
        event = "VeryLazy",
        opts = {}
    },

    {
        -- Enhanced increment and decrement
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
        config = function()
            local augend = require("dial.augend")
            require("dial.config").augends:register_group {
                default = {
                    augend.integer.alias.decimal_int,
                    augend.integer.alias.hex,
                    augend.integer.alias.binary,
                    augend.constant.alias.bool,
                    augend.constant.new {
                        elements = { "and", "or" },
                        word = true,
                        cyclic = true,
                    },
                    augend.constant.new {
                        elements = { "&&", "||" },
                        word = false,
                        cyclic = true,
                    },
                }
            }
        end
    },

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

    {
        -- Skip quotes and parentheses with tab
        'abecodes/tabout.nvim',
        event = { 'InsertEnter', "CmdLineEnter" },
        dependencies = {
            'nvim-treesitter/nvim-treesitter',
            'saghen/blink.cmp'
        },
        priority = 999,
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
    },

    {
        -- Autocomplete quotes and parentheses
        'windwp/nvim-autopairs',
        event = 'InsertEnter',
        opts = {}
    },

    {
        -- Align by character
        'tommcdo/vim-lion',
        init = function()
            vim.g.lion_squeeze_spaces = 1
        end,
        keys = {
            { 'gl', mode = { 'n', 'v' } },
        },
    },

    {
        -- Repeat more commands with dot
        'tpope/vim-repeat',
        event = 'VeryLazy'
    },

    {
        -- Remove buffers without closing windows
        'famiu/bufdelete.nvim',
        cmd = 'Bdelete',
    },

    -- {
    --     -- Switch to english layout when entering insert mode
    --     "ivanesmantovich/xkbswitch.nvim",
    --     enabled = false,
    --     event = { "InsertEnter", "CmdLineEnter" },
    --     opts = {},
    -- },

    -- {
    --     -- Automate bullet lists
    --     "bullets-vim/bullets.vim",
    --     enabled = false,
    --     ft = { "markdown", "text", "gitcommit" },
    -- }
}
