--- File for performing actions after loading all plugins ---

-- Set colorscheme
vim.cmd('colorscheme catppuccin')

-- Set telescope highlights
vim.cmd [[
hi link TelescopePromptBorder CursorLine
hi link TelescopePromptNormal CursorLine
hi link TelescopeNormal StatusLine
hi link TelescopePreviewBorder StatusLine
hi link TelescopeResultsBorder StatusLine
hi link TelescopePreview StatusLine
hi link TelescopeResults StatusLine
hi link TelescopeTitle lualine_a_normal
]]

-- vim.cmd [[hi link CmpItemMenu CmpItemAbbr]]
