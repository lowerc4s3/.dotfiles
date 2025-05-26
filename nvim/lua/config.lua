local opt     = vim.opt
local autocmd = vim.api.nvim_create_autocmd
local augroup = vim.api.nvim_create_augroup
local cmd     = vim.cmd
local g       = vim.g

--- Set russian keymap ---
opt.langmap="ФИСВУАПРШОЛДЬТЩЗЙКЫЕГМЦЧНЯЖ;ABCDEFGHIJKLMNOPQRSTUVWXYZ:,фисвуапршолдьтщзйкыегмцчня;abcdefghijklmnopqrstuvwxyz"

--- Tabs ---
opt.expandtab      = true                             -- Turn tabs into spaces
opt.smarttab       = true                             -- Delete tabs
opt.shiftwidth     = 4                                -- Tab size for autoindents
opt.tabstop        = 4                                -- Number of spaces in tabs
opt.softtabstop    = 4                                -- Insert tabs
opt.autoindent     = true                             -- Autoindent new lines

--- Editor prefs ---
opt.mouse               = "a"                         -- Mouse support in all modes
opt.clipboard           = "unnamedplus"               -- System clipboard
opt.ignorecase          = true                        -- Case insensitive search...
opt.smartcase           = true                        -- ...unless capital is typed
opt.scrolloff           = 8                           -- Cursor indent
opt.sidescrolloff       = 8                           -- Cursor indent
opt.wrap                = false                       -- Don't wrap lines
opt.timeoutlen          = 500                         -- Timeout for which-key plugin
opt.updatetime          = 4000                        -- Swap file update delay
g.cursorhold_updatetime = 400                         -- CursorHold activation time (used for lsp diagnostics)
g.mapleader             = " "                         -- Set leader key
g.maplocalleader        = " "                         -- Set leader key
cmd 'language en_US.UTF-8'                            -- Set english
-- opt.spell               = true
opt.spelllang           = "en_us,ru"

--- Folds ---
opt.foldmethod     = "expr"
-- opt.foldexpr       = "nvim_treesitter#foldexpr()"     -- Treesitter folds
opt.foldlevel      = 999                              -- Disable autofolding

--- Window splits ---
opt.splitright     = true                             -- Split window on the right
opt.splitbelow     = true                             -- Spawn window below

--- UI prefs ---
opt.shortmess      = opt.shortmess + { S = true, s = true, }
opt.showmode       = false                            -- Dont show current mode in command line
opt.fillchars      = { eob = " " }                    -- Remove "~" chars at EOB
opt.termguicolors  = true                             -- 24-bit colors
opt.number         = true                             -- Number line
opt.relativenumber = true                             -- Relative numberline
opt.cursorline     = true                             -- Highlight line with cursor
opt.signcolumn     = "yes"                            -- Always show signcolumn (e.g. LSP warnings)
opt.ruler          = false                            -- Disable cursor position (done by lualine)
opt.laststatus     = 3                                -- Global statusline
opt.title          = true                             -- Set title
opt.showcmd        = false
opt.guicursor:prepend { "a:Cursor" }                  -- Force Cursor hl in all modes

--- Autocmds ---
augroup("YankHighlight", { clear = false })
autocmd("TextYankPost", {
    desc = "Highlight yank",
    group = "YankHighlight",
    pattern = "*",
    callback = function ()
        vim.highlight.on_yank{timeout=100, higroup="Visual", on_visual=false}
    end
})

autocmd("FileType", {
    desc = "Quit help pages with 'q'",
    pattern = { "help", "qf", "man" },
    command = "nnoremap <silent> <buffer> q :close<CR>"
})
