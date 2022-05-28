-- Load impatient
if not pcall(require, "impatient") then
    vim.notify("Error loading impatient")
end

-- Use filetype.lua instead if filetype.vim
vim.g.do_filetype_lua = 1

-- Disable some builtin plugins
local disabled_built_ins = {
    "netrw",
    "netrwPlugin",
    "netrwSettings",
    "netrwFileHandlers",
    "gzip",
    "zip",
    "zipPlugin",
    "tar",
    "tarPlugin",
    "getscript",
    "getscriptPlugin",
    "vimball",
    "vimballPlugin",
    "2html_plugin",
    "logipat",
    "rrhelper",
    "spellfile_plugin",
    "matchit"
}

for _, plugin in pairs(disabled_built_ins) do
    vim.g["loaded_" .. plugin] = 1
end

-- Load configs
require('config')
require('mappings')
require('plugins')
require('after')
