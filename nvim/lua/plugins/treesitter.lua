return {
    {
        -- Syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        lazy = false,
        branch = 'main',
        build = ':TSUpdate',
        dependencies = 'OXY2DEV/markview.nvim',
        config = function()
            local parsers = require("nvim-treesitter.config").installed_parsers()
            if parsers == nil then
                vim.api.nvim_create_autocmd('FileType', {
                    pattern = require("nvim-treesitter.config").installed_parsers(),
                    callback = function()
                        vim.treesitter.start()
                        vim.wo.foldexpr = 'v:lua.vim.treesitter.foldexpr()'
                        vim.bo.indentexpr = "v:lua.require'nvim-treesitter'.indentexpr()"
                    end
                })
            end
        end
    },

    {
        -- Custom text objects
        "nvim-treesitter/nvim-treesitter-textobjects",
        dependencies = 'nvim-treesitter/nvim-treesitter',
        branch = 'main',
        opts = {
            select = {
                lookahead = true,
            }
        },
        config = function(_, opts)
            require("nvim-treesitter-textobjects").setup(opts)
            local select_mappings = {
                ["af"] = "@function.outer",
                ["if"] = "@function.inner",
                ["al"] = "@loop.outer",
                ["il"] = "@loop.inner",
                ["ai"] = "@condition.outer",
                ["ii"] = "@condition.inner",
                ["ac"] = "@class.outer",
                ["ic"] = "@class.inner",
                ["aC"] = "@comment.outer",
                ["iC"] = "@comment.inner",
                ["aP"] = "@parameter.outer",
                ["iP"] = "@parameter.inner",
            }

            local select_textobject = require("nvim-treesitter-textobjects.select").select_textobject
            for lhs, capture in pairs(select_mappings) do
                vim.keymap.set({ "x", "o" }, lhs, function() select_textobject(capture, "textobjects") end)
            end
        end,
        keys = {
            { "af", mode = { "x", "o" } },
            { "if", mode = { "x", "o" } },
            { "al", mode = { "x", "o" } },
            { "il", mode = { "x", "o" } },
            { "ai", mode = { "x", "o" } },
            { "ii", mode = { "x", "o" } },
            { "ac", mode = { "x", "o" } },
            { "ic", mode = { "x", "o" } },
            { "aC", mode = { "x", "o" } },
            { "iC", mode = { "x", "o" } },
            { "aP", mode = { "x", "o" } },
            { "iP", mode = { "x", "o" } },
        }
    },

    {
        -- Indentation lines
        'lukas-reineke/indent-blankline.nvim',
        main = 'ibl',
        dependencies = 'nvim-treesitter/nvim-treesitter',
        opts = {
            indent = {
                char = '│',
            },
            scope = {
                show_start = false,
                show_end = false,
            },
        }
    }
}
