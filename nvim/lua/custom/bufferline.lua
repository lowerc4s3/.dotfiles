require("bufferline").setup{
    options = {
        themable = false,
        offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
        buffer_close_icon = "",
        modified_icon = "", -- 
        close_icon = "",
        show_close_icon = false,
        show_buffer_close_icons = false,
        left_trunc_marker = "", --
        right_trunc_marker = "", --
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 24,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        separator_style = { "", "" }, --slant, thin
        always_show_bufferline = false,
        diagnostics = "nvim_lsp",
        -- diagnostics_indicator = function(count, level, diagnostics_dict, context)
        diagnostics_indicator = function(count, _)
            return "[" .. count .. "]"
        end
    },

    highlights = {
        modified                    = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        -- modified_visible            = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },

        hint                        = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        hint_diagnostic             = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        hint_selected               = { gui   = "bold" },
        hint_diagnostic_selected    = { gui   = "bold" },

        info                        = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        info_diagnostic             = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        info_selected               = { gui   = "bold" },
        info_diagnostic_selected    = { gui   = "bold" },

        warning                     = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        warning_diagnostic          = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        warning_selected            = { gui   = "bold" },
        warning_diagnostic_selected = { gui   = "bold" },

        error                       = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        error_diagnostic            = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        error_selected              = { gui   = "bold" },
        error_diagnostic_selected   = { gui   = "bold" },

        diagnostic_selected         = { gui   = "bold" },

        duplicate_visible = {
            guibg = { attribute = "bg", highlight = "Normal" },
            gui = "italic"
        },
        duplicate = {
            guibg = { attribute = "bg", highlight = "lualine_c_normal" },
            gui = "italic"
        },
        duplicate_selected = { gui = "italic" },

        fill                        = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        background                  = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        separator                   = { guibg = { attribute = "bg", highlight = "lualine_c_normal" } },
        indicator_selected          = { guifg = { attribute = "fg", highlight = "Ignore" } },
        buffer_visible              = { guibg = { attribute = "bg", highlight = "Normal" } },
        buffer_selected             = { gui   = "bold" },
    }
}
