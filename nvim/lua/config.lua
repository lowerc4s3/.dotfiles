local opt  = vim.opt
local exec = vim.api.nvim_exec
local cmd  = vim.cmd
local g    = vim.g

--- Set russian keymap ---
cmd "set langmap=ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

--- Tabs ---
opt.expandtab      = true                             -- Turn tabs into spaces
opt.smarttab       = true                             -- Delete tabs
opt.shiftwidth     = 4                                -- Tab size for autoindents
opt.tabstop        = 4                                -- Number of spaces in tabs
opt.softtabstop    = 4                                -- Insert tabs
opt.smartindent    = true                             -- Autoindent new lines

--- Editor prefs ---
opt.mouse               = "a"                         -- Mouse support in all modes
opt.clipboard           = "unnamedplus"               -- System clipboard
opt.ignorecase          = true                        -- Case insensetive search...
opt.smartcase           = true                        -- ...unless capital is typed
opt.scrolloff           = 8                           -- Cursor indent
opt.sidescrolloff       = 8                           -- Cursor indent
opt.wrap                = false                       -- Dont wrap lines
opt.timeoutlen          = 500                         -- Timeout for which-key plugin
opt.updatetime          = 4000                        -- Swap file update delay
g.cursorhold_updatetime = 400                         -- CursorHold activation time (used for lsp diagnostics)
g.hlsearch              = false                       -- Don't highlight prev. search
g.mapleader             = " "                         -- Set leader key
g.maplocalleader        = " "                         -- Set leader key
cmd 'language en_US.UTF-8'                            -- Set english

--- Folds ---
opt.foldmethod     = "expr"
opt.foldexpr       = "nvim_treesitter#foldexpr()"     -- Treesitter folds
opt.foldlevel      = 999                              -- Disable autofolding

--- Window splits ---
opt.splitright     = true                             -- Split window on the right
opt.splitbelow     = true                             -- Spawn window below

--- UI prefs ---
cmd 'colorscheme catppuccin'                          -- Set colorscheme
cmd 'set noshowmode'                                  -- Dont show current mode in command line
cmd 'set guifont=JetBrainsMono_Nerd_Font:h14'         -- Set font for GUI clients
g.fillchars        = { eob = "" }                     -- Remove "~" chars at EOB
g.termguicolors    = true                             -- 24-bit colors
opt.number         = true                             -- Number line
opt.relativenumber = true                             -- Relative numberline
opt.cursorline     = true                             -- Highlight line with cursor
opt.signcolumn     = "yes"                            -- Always show signcolumn (e.g. LSP warnings)
opt.ruler          = false                            -- Disable cursor position (done by lualine)
opt.laststatus     = 3                                -- Global statusline

--- Highlight yank ---
exec([[
augroup YankHighlight
autocmd!
autocmd TextYankPost * silent! lua vim.highlight.on_yank{timeout=100, higroup="Visual", on_visual=false}
augroup end
]], false)

-- Don't show any numbers inside terminals (NOTE: enabling this breaks toggleterm) ---
-- cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]

--- Quit help pages with 'q' ---
cmd [[ au FileType help,qf,man nnoremap <silent> <buffer> q :close<CR> ]]

--- Neovide settings ---
-- g.neovide_cursor_animation_length = 0.03
-- g.neovide_cursor_trail_length = 0.01
-- g.neovide_hide_mouse_when_typing = true
