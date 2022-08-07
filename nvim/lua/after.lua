--- File for performing actions after loading all plugins (usually highlights) ---

-- Set colorscheme
vim.g.tokyonight_style = "night"
vim.g.catppuccin_flavour = "mocha"
vim.cmd('colorscheme onedark')

-- Set highlights
vim.cmd [[
" Telescope
hi! link TelescopePromptBorder CursorLine
hi! link TelescopePromptNormal CursorLine
hi! link TelescopeNormal lualine_c_normal
hi! link TelescopePreviewBorder lualine_c_normal
hi! link TelescopeResultsBorder lualine_c_normal
hi! link TelescopePreview lualine_c_normal
hi! link TelescopeResults lualine_c_normal
hi! link TelescopeTitle lualine_a_insert

" Floating window borders
hi! link FloatBorder NormalFloat

" Disable nvimtree separator
hi! link NvimTreeVertSplit Ignore
]]
