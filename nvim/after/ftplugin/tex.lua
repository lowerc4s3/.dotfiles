vim.keymap.set({ "n", "v" }, "k", "v:count == 0 ? 'gk' : 'k'", { expr = true, buffer = true })
vim.keymap.set({ "n", "v" }, "j", "v:count == 0 ? 'gj' : 'j'", { expr = true, buffer = true })
vim.opt_local.wrap = false
vim.opt_local.linebreak = true
vim.opt_local.spell = true
vim.opt.textwidth = 80
