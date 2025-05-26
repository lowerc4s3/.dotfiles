require("catppuccin").setup {
    flavour = 'mocha',
    term_colors = true,
    integrations = {
        which_key = true,
        telescope = false,
        lsp_trouble = true,
        symbols_outline = true,
        cmp = true,
        dap = {
            enabled = true,
            enable_ui = true,
        },
        native_lsp = {
            enabled = true,
            underlines = {
                errors = { "undercurl" },
                hints = { "undercurl" },
                warnings = { "undercurl" },
                information = { "undercurl" },
            },
        }
    },
    custom_highlights = function(colors)
        return {
            -- atom-like nvim-cmp kind highlights
            -- check https://github.com/catppuccin/nvim/discussions/323#discussioncomment-4410359
            CmpItemKindSnippet = { fg = colors.base, bg = colors.mauve },
            CmpItemKindKeyword = { fg = colors.base, bg = colors.red },
            CmpItemKindText = { fg = colors.base, bg = colors.teal },
            CmpItemKindMethod = { fg = colors.base, bg = colors.blue },
            CmpItemKindConstructor = { fg = colors.base, bg = colors.blue },
            CmpItemKindFunction = { fg = colors.base, bg = colors.blue },
            CmpItemKindFolder = { fg = colors.base, bg = colors.blue },
            CmpItemKindModule = { fg = colors.base, bg = colors.blue },
            CmpItemKindConstant = { fg = colors.base, bg = colors.peach },
            CmpItemKindField = { fg = colors.base, bg = colors.green },
            CmpItemKindProperty = { fg = colors.base, bg = colors.green },
            CmpItemKindEnum = { fg = colors.base, bg = colors.green },
            CmpItemKindUnit = { fg = colors.base, bg = colors.green },
            CmpItemKindClass = { fg = colors.base, bg = colors.yellow },
            CmpItemKindVariable = { fg = colors.base, bg = colors.flamingo },
            CmpItemKindFile = { fg = colors.base, bg = colors.blue },
            CmpItemKindInterface = { fg = colors.base, bg = colors.yellow },
            CmpItemKindColor = { fg = colors.base, bg = colors.red },
            CmpItemKindReference = { fg = colors.base, bg = colors.red },
            CmpItemKindEnumMember = { fg = colors.base, bg = colors.red },
            CmpItemKindStruct = { fg = colors.base, bg = colors.blue },
            CmpItemKindValue = { fg = colors.base, bg = colors.peach },
            CmpItemKindEvent = { fg = colors.base, bg = colors.blue },
            CmpItemKindOperator = { fg = colors.base, bg = colors.blue },
            CmpItemKindTypeParameter = { fg = colors.base, bg = colors.blue },
            CmpItemKindCopilot = { fg = colors.base, bg = colors.teal },

            ModeMsg = { fg = colors.green },
        }
    end,
}
