require("bufferline").setup{
    options = {
        themable = false,
        offsets = { { filetype = "NvimTree", text = "", padding = 0 } },
        buffer_close_icon = "",
        modified_icon = "", -- 
        close_icon = "",
        show_close_icon = false,
        show_buffer_close_icons = false,
        left_trunc_marker = "",
        right_trunc_marker = "",
        max_name_length = 14,
        max_prefix_length = 13,
        tab_size = 22,
        show_tab_indicators = true,
        enforce_regular_tabs = false,
        separator_style = "thin", --slant
        always_show_bufferline = false,
        diagnostics = "nvim_lsp",
        diagnostics_indicator = function(count, level, diagnostics_dict, context)
            -- local icon = level:match("error") and " " or " "
            return "[" .. count .. "]"
        end
    },

    highlights = {
        fill = {
            guibg = { attribute = "bg", highlight = "StatusLine" }
        },
        background = {
            guibg = { attribute = "bg", highlight = "StatusLine" }
        },
        separator = {
            guibg = { attribute = "bg", highlight = "StatusLine" }
        },
        buffer_selected             = { gui = "none" },
        diagnostic_selected         = { gui = "none" },
        info_selected               = { gui = "none" },
        info_diagnostic_selected    = { gui = "none" },
        warning_selected            = { gui = "none" },
        warning_diagnostic_selected = { gui = "none" },
        error_selected              = { gui = "none" },
        error_diagnostic_selected   = { gui = "none" },
        duplicate_selected          = { gui = "none" },
        duplicate_visible           = { gui = "none" },
        duplicate                   = { gui = "none" },
    }
}
