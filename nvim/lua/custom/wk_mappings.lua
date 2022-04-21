local wk = require("which-key")

-- Options for which-key
local opts = {
    mode    = "n",   -- NORMAL mode
    prefix  = "<leader>",
    buffer  = nil,   -- Global mappings. Specify a buffer number for buffer local mappings
    silent  = true,  -- use `silent` when creating keymaps
    noremap = true,  -- use `noremap` when creating keymaps
    nowait  = false, -- use `nowait` when creating keymaps
}

-- Which-key mappings
wk.register({
    ["s"] = { "<cmd>w<CR>", " Save" },
    ["S"] = { "<cmd>wa<CR>", " Save all" },
    ["x"] = { "<cmd>Bdelete<CR>", " Close buffer" },
    ["X"] = { "<cmd>Bdelete!<CR>", " Force close buffer" },
    ["q"] = { "<cmd>q<CR>", " Quit" },
    ["/"] = { "<cmd>NvimTreeFocus<cr>", "פּ Open file tree" },
    ["."] = { "<cmd>Telescope file_browser<CR>", " Find files" },
    ["<leader>"] = { "<cmd>Telescope find_files<CR>", " Find project files" },

    f = {
        name = " Find",
        ["f"] = { "<cmd>Telescope find_files<CR>", " Find project files" },
        ["r"] = { "<cmd>Telescope oldfiles<CR>", "ﭯ Recent files" },
        ["b"] = { "<cmd>Telescope buffers<CR>", " Buffers" },
        ["p"] = { "<cmd>Telescope projects theme=ivy<CR>", " Projects" },
        ["w"] = { "<cmd>Telescope live_grep<CR>", " Word" },
        ["d"] = { "<cmd>Telescope file_browser<CR>", " Directory" },
        -- ["t"] = { "<cmd>TodoTrouble<CR>", " List todos"},
    },

    g = {
        name = " Git",
        ["p"] = { "<cmd>Glow<CR>", " Preview" },
        ["d"] = { "<cmd>DiffviewOpen<CR>", " Open Diff" },
        ["c"] = { "<cmd>DiffviewClose<CR>", " Close Diff" },
    },

    d = {
        name = '金Debug & compile',
        -- ["c"] = { "<cmd>lua require('yabs'):run_task('build')<cr>", "Compile file"},
        -- ["r"] = { "<cmd>lua require('yabs'):run_task('run')<cr>", "Run file"},
        ["c"] = { "<cmd>YabsTask build<cr>", " Compile file"},
        ["r"] = { "<cmd>YabsTask run<cr>", "金Run file"},
        ["b"] = { "<cmd>lua require'dap'.toggle_breakpoint()<cr>", "ﱢ Toggle breakpoint"},
        ["d"] = { "<cmd>lua require'dap'.continue()<cr>", " Start debug"},
    },

    c = {
        name = " Code",
        ["d"] = { "<cmd>Trouble<cr>", " Diagnostics"},
        ["r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", " Rename"},
        ["f"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "靖Format"},
        ["R"] = { "<cmd>Telescope lsp_references<CR>", " References" },
        ["a"] = { '<cmd>Telescope lsp_code_actions theme=cursor<CR>', " Actions" },
    },

    p = {
        name = " Packages",
        ["c"] = { "<cmd>PackerCompile<bar>LuaCacheClear<CR>", " Compile" },
        ["C"] = { "<cmd>PackerClean<CR>", " Clean" },
        ["i"] = { "<cmd>PackerInstall<CR>", " Install" },
        ["s"] = { "<cmd>PackerSync<CR>", "痢Sync" },
        ["S"] = { "<cmd>PackerStatus<CR>", " Status" },
        ["u"] = { "<cmd>PackerUpdate<CR>", "祝Update" },
        ["r"] = { "<cmd>source %<CR>", "勒Reload neovim file"}
    },

    w = {
        name = "𧻓Window",
        ["s"] = { "<C-w>s", " Horizontal split" },
        ["v"] = { "<C-w>v", " Vertical split" },
        ["c"] = { "<C-w>c", "窱Close" },
        ["b"] = { "<C-w>=", " Balance" },
    },
}, opts)
-- Install –  , Window = 
