return {
    -- Status line
    'nvim-lualine/lualine.nvim',
    dependencies = 'kyazdani42/nvim-web-devicons',
    opts = function()
        -- Elements customization

        local mode = {
            'mode',
            fmt = function(str) return str:sub(1, 3) end
        }

        local searchcount = {
            'searchcount',
            padding = { left = 0, right = 1 },
        }

        local selectioncount = {
            'selectioncount',
            icon = '󰫙',
            padding = { left = 0, right = 1 },
        }

        local branch = {
            'branch',
            icon = ''
        }

        local diff = {
            'diff',
            symbols = { added = ' ', modified = ' ', removed = ' ' },
            padding = { left = 0, right = 1 }
        }

        local filetype = {
            'filetype',
            padding = { left = 1, right = 0 },
            icon_only = true
        }

        local filename = {
            'filename',
            padding = 1,
            path = 1,
            symbols = { modified = '󰆓', readonly = '󰌾', unnamed = '' },
            fmt = function(str) return str:gsub("/", "  ") end
        }

        local diagnostics = {
            'diagnostics',
            update_in_insert = false,
            symbols = { error = " ", warn = " ", hint = "󰌶 ", info = "󰋽 " },
        }

        local encoding = {
            'encoding',
            fmt = function(str) return string.upper(str) end,
            padding = { left = 1, right = 0 }
        }

        local tabsize = {
            function()
                local type = vim.bo.expandtab and "SPC" or "TAB"
                local size = vim.bo.expandtab and vim.bo.shiftwidth or vim.bo.tabstop
                return type .. ":" .. size
            end,
            padding = { left = 1, right = 0 },
            cond = function()
                return vim.bo.filetype ~= ""
            end,
        }

        local fileformat = {
            'fileformat',
            padding = 1,
            symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' }
        }

        local progress = {
            '%P',
            icon = "󰍜",
            padding = { left = 1, right = 0 }
        }

        local showmode = {
            require("noice").api.status.mode.get,
            cond = require("noice").api.status.mode.has,
            color = "NoiceVirtualText"
        }

        local filename_inactive = {
            'filename',
            padding = 1,
            path = 0,
            symbols = { modified = '󰆓', readonly = '󰌾', unnamed = '' }
        }

        return {
            options = {
                icons_enabled = true,
                theme = 'auto',
                component_separators = { left = '', right = '' },
                section_separators = { left = '', right = '' }, -- 
                disabled_filetypes = {},
                always_divide_middle = true,
                globalstatus = true,
            },

            sections = {
                lualine_a = { mode, searchcount, selectioncount },
                lualine_b = { branch, diff },
                lualine_c = { filetype, filename },
                lualine_x = { diagnostics, showmode },
                lualine_y = { tabsize, encoding, fileformat },
                lualine_z = { progress, 'location' }
            },

            inactive_sections = {
                lualine_a = {},
                lualine_b = {},
                lualine_c = { filename_inactive },
                lualine_x = { 'location' },
                lualine_y = {},
                lualine_z = {}
            },
            tabline = {},
            extensions = { 'nvim-dap-ui', 'toggleterm', 'nvim-tree', 'trouble', }
        }
    end
}
