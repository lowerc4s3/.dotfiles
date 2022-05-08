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
        -- buffer_selected             = { gui = "" },
        -- diagnostic_selected         = { gui = "" },
        -- hint_selected               = { gui = "" },
        -- hint_diagnostic_selected    = { gui = "" },
        -- info_selected               = { gui = "" },
        -- info_diagnostic_selected    = { gui = "" },
        -- warning_selected            = { gui = "" },
        -- warning_diagnostic_selected = { gui = "" },
        -- error_selected              = { gui = "" },
        -- error_diagnostic_selected   = { gui = "" },
        -- duplicate_selected          = { gui = "" },
        -- duplicate_visible           = { gui = "" },
        -- duplicate                   = { gui = "" },
        buffer_selected             = { gui = "italic" },
        diagnostic_selected         = { gui = "italic" },
        hint_selected               = { gui = "italic" },
        hint_diagnostic_selected    = { gui = "italic" },
        info_selected               = { gui = "italic" },
        info_diagnostic_selected    = { gui = "italic" },
        warning_selected            = { gui = "italic" },
        warning_diagnostic_selected = { gui = "italic" },
        error_selected              = { gui = "italic" },
        error_diagnostic_selected   = { gui = "italic" },
        duplicate_selected          = { gui = "italic" },
        duplicate_visible           = { gui = "italic" },
        duplicate                   = { gui = "italic" },
    }
}
