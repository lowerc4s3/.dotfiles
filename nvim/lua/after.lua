--- File for performing actions after loading all plugins (usually highlights) ---

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

-- Fidget
vim.api.nvim_set_hl(0, "FidgetTitle", { link = "Bold" })

-- Cattpuccin termcolors (catppuccin theme integration is ass)
if vim.g.neovide and vim.g.colors_name:find("catppuccin", 1, true) == 1 then
    vim.g.terminal_color_0 = "#45475A"
    vim.g.terminal_color_8 = "#45475A"
    vim.g.terminal_color_1 = "#F38BA8"
    vim.g.terminal_color_9 = "#F38BA8"
    vim.g.terminal_color_2 = "#A6E3A1"
    vim.g.terminal_color_10 = "#A6E3A1"
    vim.g.terminal_color_3 = "#F9E2AF"
    vim.g.terminal_color_11 = "#F9E2AF"
    vim.g.terminal_color_4 = "#89B4FA"
    vim.g.terminal_color_12 = "#89B4FA"
    vim.g.terminal_color_5 = "#F5C2E7"
    vim.g.terminal_color_13 = "#F5C2E7"
    vim.g.terminal_color_6 = "#94E2D5"
    vim.g.terminal_color_14 = "#94E2D5"
    vim.g.terminal_color_7 = "#BAC2DE"
    vim.g.terminal_color_15 = "#BAC2DE"
end
