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
opt.ignorecase          = true                        -- Case insensetive search...
opt.smartcase           = true                        -- ...unless capital is typed
opt.scrolloff           = 8                           -- Cursor indent
opt.sidescrolloff       = 8                           -- Cursor indent
opt.wrap                = false                       -- Dont wrap lines
opt.timeoutlen          = 500                         -- Timeout for which-key plugin
opt.updatetime          = 4000                        -- Swap file update delay
g.cursorhold_updatetime = 400                         -- CursorHold activation time (used for lsp diagnostics)
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
opt.showmode       = false                            -- Dont show current mode in command line
opt.fillchars      = { eob = " " }                    -- Remove "~" chars at EOB
opt.termguicolors  = true                             -- 24-bit colors
opt.number         = true                             -- Number line
opt.relativenumber = true                             -- Relative numberline
opt.cursorline     = true                             -- Highlight line with cursor
opt.signcolumn     = "yes"                            -- Always show signcolumn (e.g. LSP warnings)
opt.ruler          = false                            -- Disable cursor position (done by lualine)
opt.laststatus     = 3                                -- Global statusline
opt.guifont="JetBrainsMono_Nerd_Font:h14"             -- Set font for GUI clients

--- Autocmds ---
-- Highlight yank
augroup("YankHighlight", { clear = false })
autocmd("TextYankPost", {
    desc = "Highlight yank",
    group = "YankHighlight",
    pattern = "*",
    callback = function ()
        vim.highlight.on_yank{timeout=100, higroup="Visual", on_visual=false}
    end
})

-- Quit help pages with 'q'
autocmd("FileType", {
    desc = "Quit help pages with 'q'",
    pattern = { "help", "qf", "man" },
    command = "nnoremap <silent> <buffer> q :close<CR>"
})

-- Autoformating opts (don't insert comment symbol after hitting o, O or <CR>)
autocmd("BufEnter", {
    desc = "Autoformating opts (don't insert comment symbol after hitting o, O or <CR>)",
    pattern = "*",
    command = 'set formatoptions-=ro'
})

-- Compile plugins file whenever it's updated
-- augroup("PackerAutoCompile", {clear = true})
-- autocmd("BufWritePost", {
--     group = "PackerAutoCompile",
--     pattern = "plugins.lua",
--     command = "source <afile> | PackerCompile"
-- })

-- Don't show any numbers inside terminals
-- NOTE: enabling this breaks toggleterm
-- cmd [[ au TermOpen term://* setlocal nonumber norelativenumber | setfiletype terminal ]]
