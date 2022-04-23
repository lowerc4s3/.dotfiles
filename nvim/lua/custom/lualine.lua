require('lualine').setup {
    options = {
        icons_enabled = true,
        theme = 'auto',
        component_separators = { left = '', right = ''},
        section_separators = { left = '', right = ''}, -- 
        -- disabled_filetypes = { "NvimTree", "DiffviewFiles" },
        disabled_filetypes = {},
        always_divide_middle = true,
        globalstatus = true,
    },

    sections = {
        lualine_a = { { 'mode', fmt = function(str) return str:sub(1,3) end } },

        lualine_b = {
            { 'branch', icon = '' },
            { 'diff', symbols = {added = ' ', modified = ' ', removed = ' '} },
        },

        lualine_c = {
            { 'filetype', padding = {left = 1, right = 0}, icon_only = true },

            {
                'filename',
                padding = 1,
                path = 1,
                symbols = { modified = ' ', readonly = ' ', unnamed  = '[?]' }
            },
        },

        lualine_x = {
            {
                'diagnostics',
                update_in_insert = false,
                symbols = { error = " ", warn = " ", hint = " ", info = " " },
            }
        },
        lualine_y = {
            { 'encoding', fmt = function(str) return string.upper(str) end },
            { 'fileformat', symbols = { unix = 'LF', dos = 'CRLF', mac = 'CR' } }
        },
        lualine_z = {{ '%P', icon = " ",  padding = 0 }, 'location'}
    },
    inactive_sections = {
        lualine_a = {},
        lualine_b = {},
        lualine_c = {
            {
                'filename',
                padding = 1,
                path = 0,
                symbols = { modified = ' ', readonly = ' ', unnamed  = '[?]' }
            },
        },
        lualine_x = {'location'},
        lualine_y = {},
        lualine_z = {}
    },
    tabline = {},
    extensions = {}
}
