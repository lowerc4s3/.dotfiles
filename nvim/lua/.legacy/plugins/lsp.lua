return {
    {
        -- Code action menu
        -- (disabled and replaced with tiny-code-action)
        'weilbith/nvim-code-action-menu',
        cmd = 'CodeActionMenu',
        enabled = false,
        init = function()
            vim.g.code_action_menu_show_details = false
            vim.g.code_action_menu_show_diff = false
            vim.g.code_action_menu_window_border = 'solid'
        end
    },

    {
        -- Tree-like view for symbols
        'simrat39/symbols-outline.nvim',
        enabled = false,
        cmd = 'SymbolsOutline',
        opts = {
            width = 33,
            symbols = {
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
            },
        }
    }
}
