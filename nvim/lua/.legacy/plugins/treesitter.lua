return {
    {
        -- Syntax highlighting
        'nvim-treesitter/nvim-treesitter',
        build = ':TSUpdate',
        event = { 'BufReadPost', 'BufNewFile' },
        dependencies = {
            'nvim-treesitter/nvim-treesitter-textobjects',
            'rush-rs/tree-sitter-asm',
            'lukas-reineke/indent-blankline.nvim',
            'OXY2DEV/markview.nvim',
        },

        config = function()
            require('nvim-treesitter.configs').setup {
                ensure_installed = {
                    "yaml", "python", "c",
                    "cpp", "lua", "bash",
                    "vim", "markdown", "make",
                    "rust", "asm", "latex",
                    "go", "sql"
                },

                auto_install = true,
                sync_install = false,
                ignore_install = {},
                highlight = {
                    enable = true,
                    disable = {},
                    additional_vim_regex_highlighting = false,
                },
                textobjects = {
                    select = {
                        enable = true,
                        lookahead = true,
                        keymaps = {
                            ["af"] = "@function.outer",
                            ["if"] = "@function.inner",
                            ["al"] = "@loop.outer",
                            ["il"] = "@loop.inner",
                            ["ac"] = "@conditional.outer",
                            ["ic"] = "@conditional.inner",
                            ["aC"] = "@class.outer",
                            ["iC"] = "@class.inner",
                            ["aP"] = "@parameter.outer",
                            ["iP"] = "@parameter.inner",
                        },
                    },
                },
            }

            -- Get assembly parser
            require('nvim-treesitter.parsers').get_parser_configs().asm = {
                install_info = {
                    url = 'https://github.com/rush-rs/tree-sitter-asm.git',
                    files = { 'src/parser.c' },
                    branch = 'main',
                },
            }
        end
    }
}
