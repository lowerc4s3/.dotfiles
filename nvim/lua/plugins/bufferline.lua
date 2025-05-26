return {
    {
        -- Tabs
        'akinsho/bufferline.nvim',
        event = 'VeryLazy',
        dependencies = 'kyazdani42/nvim-web-devicons',
        opts = {
            options = {
                themable = false,
                numbers = "none",
                indicator = { style = "none" },
                buffer_close_icon = "󰅖",
                modified_icon = "",
                close_icon = "󰅙",
                left_trunc_marker = "󰁍",
                right_trunc_marker = "󰁔",
                max_name_length = 14,
                max_prefix_length = 13,
                tab_size = 22,
                diagnostics = "nvim_lsp",
                diagnostics_indicator = function(count, _)
                    return "[" .. count .. "]"
                end,
                offsets = { { filetype = "NvimTree", text = "" } },
                color_icons = true,
                show_buffer_close_icons = false,
                show_tab_indicators = false,
                separator_style = { "", "" },
                always_show_bufferline = false,
                hover = { enabled = false, },
                sort_by = "insert_after_current",
            },

            highlights = {
                modified                    = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },

                hint                        = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },
                hint_diagnostic             = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },
                hint_selected               = { italic = false, bold = true },
                hint_diagnostic_selected    = { italic = false, bold = true },

                info                        = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },
                info_diagnostic             = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },
                info_selected               = { italic = false, bold = true },
                info_diagnostic_selected    = { italic = false, bold = true },

                warning                     = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },
                warning_diagnostic          = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },
                warning_selected            = { italic = false, bold = true },
                warning_diagnostic_selected = { italic = false, bold = true },

                error                       = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },
                error_diagnostic            = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },
                error_selected              = { italic = false, bold = true },
                error_diagnostic_selected   = { italic = false, bold = true },

                diagnostic_selected         = { italic = false, bold = true },

                duplicate_visible           = {
                    bg = { attribute = "bg", highlight = "Normal" },
                    italic = true
                },
                duplicate                   = {
                    bg = { attribute = "bg", highlight = "lualine_c_normal" },
                    italic = true
                },
                duplicate_selected          = { italic = true },

                fill                        = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },
                background                  = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },
                separator                   = { bg = { attribute = "bg", highlight = "lualine_c_normal" } },
                -- indicator_selected          = { fg = { attribute = "fg", highlight = "Ignore" } },
                buffer_visible              = { bg = { attribute = "bg", highlight = "Normal" } },
                buffer_selected             = { italic = false, bold = true },
            }
        }
    }
}
