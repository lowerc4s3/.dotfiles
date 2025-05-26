return {
    {
        -- Render markdown/LaTeX/etc in buffer
        "OXY2DEV/markview.nvim",
        lazy = false,
        priority = 999,
        opts = {
            preview = {
                filetypes = { "markdown", "md", "rmd", "quarto", "tex", "typst" },
                modes = { "n", "no", "c", "i" },
                hybrid_modes = { "i", "n" },
                linewise_hybrid_mode = false
            },
            markdown = {
                enable = true,
                list_items = {
                    wrap = true,
                    marker_minus = {
                        text = "•"
                    }
                },
                -- tables = {
                --     parts = {
                --         top = { "┌", "─", "┐", "┬" },
                --         header = { "│", "│", "│" },
                --         separator = { "├", "─", "┤", "┼" },
                --         row = { "│", "│", "│" },
                --         bottom = { "└", "─", "┘", "┴" },
                --
                --         overlap = { "┝", "━", "┥", "┿" },
                --
                --         align_left = "╼",
                --         align_right = "╾",
                --         align_center = { "╴", "╶" }
                --     }
                -- }
            },
            latex = {
                -- TODO: Finish latex config
                enable = false,
                fonts = {
                    enable = false,
                },
                symbols = {
                    enable = false,
                }
            }
        }
    },

    {
        -- Markdown live preview in browser
        'iamcco/markdown-preview.nvim',
        enabled = false,
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = 'markdown',
        build = ':call mkdp#util#install()'
    }
}
--[[
--    marker_minus = {
        add_padding = true,
        conceal_on_checkboxes = true,

        text = "",
        hl = "MarkviewListItemMinus"
    },

    marker_plus = {
        add_padding = true,
        conceal_on_checkboxes = true,

        text = "",
        hl = "MarkviewListItemPlus"
    },

    marker_star = {
        add_padding = true,
        conceal_on_checkboxes = true,

        text = "",
        hl = "MarkviewListItemStar"
    },

    marker_dot = {
        add_padding = true,
        conceal_on_checkboxes = true,
    },

    marker_parenthesis = {
        add_padding = true,
        conceal_on_checkboxes = true,
    }

--]]
