--- File for performing actions after loading all plugins (usually highlights) ---

-- Set colorscheme
vim.g.tokyonight_style = "night"
-- vim.cmd('colorscheme onedark')

-- Set highlights

-- Telescope
vim.api.nvim_set_hl(0, 'TelescopePromptBorder', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, 'TelescopePromptNormal', { link = 'CursorLine' })
vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = 'lualine_c_normal' })
vim.api.nvim_set_hl(0, 'TelescopeNormal', { link = 'lualine_c_normal' })
vim.api.nvim_set_hl(0, 'TelescopePreviewBorder', { link = 'lualine_c_normal' })
vim.api.nvim_set_hl(0, 'TelescopeResultsBorder', { link = 'lualine_c_normal' })
vim.api.nvim_set_hl(0, 'TelescopePreview', { link = 'lualine_c_normal' })
vim.api.nvim_set_hl(0, 'TelescopeResults', { link = 'lualine_c_normal' })
vim.api.nvim_set_hl(0, 'TelescopeTitle', { link = 'lualine_a_insert' })

-- Floating window borders
-- vim.api.nvim_set_hl(0, 'FloatBorder', { link = 'NormalFloat' })

-- Disable nvimtree separator
vim.api.nvim_set_hl(0, 'NvimTreeVertSplit', { link = 'Ignore' })
