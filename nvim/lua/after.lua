--- File for performing actions after loading all plugins ---

-- Set colorscheme
vim.g.tokyonight_style = "night"
vim.cmd('colorscheme catppuccin')

-- Set telescope highlights
vim.cmd [[
hi link TelescopePromptBorder CursorLine
hi link TelescopePromptNormal CursorLine

hi link TelescopeNormal lualine_c_normal
hi link TelescopePreviewBorder lualine_c_normal
hi link TelescopeResultsBorder lualine_c_normal
hi link TelescopePreview lualine_c_normal
hi link TelescopeResults lualine_c_normal

hi link TelescopeTitle lualine_a_insert
]]

-- vim.cmd('hi link NvimTreeVertSplit Normal')
vim.cmd('hi link NvimTreeVertSplit Ignore')

-- vim.cmd [[hi link CmpItemMenu CmpItemAbbr]]
