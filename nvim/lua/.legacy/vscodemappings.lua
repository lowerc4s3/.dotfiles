local map = vim.api.nvim_set_keymap

map('x', 'gc', '<Plug>VSCodeCommentary', { noremap = false, silent = false })
map('n', 'gc', '<Plug>VSCodeCommentary', { noremap = false, silent = false })
map('o', 'gc', '<Plug>VSCodeCommentary', { noremap = false, silent = false })
map('n', 'gcc', '<Plug>VSCodeCommentaryLine', { noremap = false, silent = false })
