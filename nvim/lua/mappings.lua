local map = vim.keymap.set
local opts = { silent = true }

map({ 'n', 'v' }, '<Space>', '<Nop>', opts)

-- Navigate windows
map("n", "<C-h>", "<C-w>h", opts)
map("n", "<C-j>", "<C-w>j", opts)
map("n", "<C-k>", "<C-w>k", opts)
map("n", "<C-l>", "<C-w>l", opts)

-- Resize windows
map("n", "<C-Up>", "<cmd>resize -2<CR>", opts)
map("n", "<C-Down>", "<cmd>resize +2<CR>", opts)
map("n", "<C-Left>", "<cmd>vertical resize -2<CR>", opts)
map("n", "<C-Right>", "<cmd>vertical resize +2<CR>", opts)

-- hjkl navigation in insert mode
map("i", "<C-h>", "<Left>", opts)
map("i", "<C-j>", "<Down>", opts)
map("i", "<C-k>", "<Up>", opts)
map("i", "<C-l>", "<Right>", opts)

-- Disable search highlight in insert and leave insert mode in terminal
map("t", "<ESC>", "<C-\\><C-N>", opts)
map("n", "<ESC>", ":noh<CR>", opts)

-- Open ToggleTerm
map("n", "<C-\\>", "<cmd>ToggleTerm<CR>", opts)
map("i", "<C-\\>", "<cmd>ToggleTerm<CR>", opts)
map("t", "<C-\\>", "<cmd>ToggleTerm<CR>", opts)

-- Switch buffers
map("n", "<TAB>", "<cmd>BufferLineCycleNext<CR>", opts)
map("n", "<S-TAB>", "<cmd>BufferLineCyclePrev<CR>", opts)

-- Instant macros
map("n", "@", '<cmd>execute "noautocmd norm!" . v:count1 . "@" . getcharstr()<CR>', opts)

-- Jump to diagnostics
map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)
