local wk = require("which-key")

-- Options for which-key
local opts = {
    mode    = "n", -- NORMAL mode
    prefix  = "<leader>",
    buffer  = nil, -- Global mappings. Specify a buffer number for buffer local mappings
    silent  = true, -- use `silent` when creating keymaps
    noremap = true, -- use `noremap` when creating keymaps
    nowait  = false, -- use `nowait` when creating keymaps
}

-- Which-key mappings
wk.register({
    ["s"] = { "<cmd>write<CR>", " Save" },
    ["S"] = { "<cmd>wall<CR>", " Save all" },
    ["x"] = { "<cmd>Bdelete<CR>", " Close buffer" },
    ["X"] = { "<cmd>Bdelete!<CR>", " Force close buffer" },
    ["q"] = { "<cmd>qa<CR>", " Quit" },
    ["/"] = { "<cmd>NvimTreeFocus<cr>", "פּ Open file tree" },
    ["."] = { "<cmd>Telescope file_browser<CR>", " Find files" },
    ["<leader>"] = { "<cmd>Telescope find_files<CR>", " Find project files" },

    f = {
        name = " Find",
        ["f"] = { "<cmd>Telescope find_files<CR>", " Find project files" },
        ["r"] = { "<cmd>Telescope oldfiles<CR>", "ﭯ Recent files" },
        ["b"] = { "<cmd>Telescope buffers<CR>", " Buffers" },
        ["p"] = { "<cmd>Telescope projects<CR>", " Projects" },
        ["w"] = { "<cmd>Telescope live_grep<CR>", " Word" },
        ["d"] = { "<cmd>Telescope file_browser<CR>", " Directory" },
        ["t"] = { "<cmd>TodoTelescope<CR>", " List todos"},
    },

    g = {
        name = " Git",
        ["d"] = { "<cmd>DiffviewOpen<CR>", " Open Diff" },
        ["c"] = { "<cmd>DiffviewClose<CR>", " Close Diff" },
    },

    d = {
        name = ' Debug',
        -- name = '金Debug & compile',
        -- ["c"] = { "<cmd>YabsTask build<cr>", " Compile file" },
        -- ["r"] = { "<cmd>YabsTask run<cr>", "金Run file" },
        ["b"] = { "<cmd>DapToggleBreakpoint<cr>", "ﱢ Toggle breakpoint" },
        ["d"] = { "<cmd>DapContinue<cr>", "金 Start debug" },
    },

    b = {
        name = ' Build',
        ["r"] = { "<cmd>YabsTask run<cr>", "金Run file" },
        ["b"] = { "<cmd>YabsTask build<cr>", " Build file" },
    },

    c = {
        name = " Code",
        ["d"] = { "<cmd>Trouble<cr>", " Diagnostics" },
        ["r"] = { "<cmd>lua vim.lsp.buf.rename()<CR>", " Rename" },
        ["f"] = { "<cmd>lua vim.lsp.buf.formatting()<CR>", "靖Format" },
        ["R"] = { "<cmd>Telescope lsp_references<CR>", " References" },
        ["a"] = { '<cmd>CodeActionMenu<CR>', " Actions" },
        -- ["a"] = { '<cmd>lua vim.lsp.buf.code_action<CR>', " Actions" },
    },

    p = {
        name = " Packages",
        ["c"] = { "<cmd>PackerCompile<bar>LuaCacheClear<CR>", " Compile" },
        ["C"] = { "<cmd>PackerClean<CR>", " Clean" },
        ["i"] = { "<cmd>PackerInstall<CR>", " Install" },
        ["s"] = { "<cmd>PackerSync<CR>", "痢Sync" },
        ["S"] = { "<cmd>PackerStatus<CR>", " Status" },
        ["u"] = { "<cmd>PackerUpdate<CR>", "祝Update" },
        ["r"] = { "<cmd>source %<CR>", "勒Reload neovim file" }
    },

    w = {
        name = "𧻓Window",
        ["s"] = { "<C-w>s", " Horizontal split" },
        ["v"] = { "<C-w>v", " Vertical split" },
        ["c"] = { "<C-w>c", "窱Close" },
        ["b"] = { "<C-w>=", " Balance" },
    },

    m = {
        name = " Markdown",
        ["p"] = { "<cmd>Glow<CR>", " Preview" },
        ["P"] = { "<cmd>MarkdownPreviewToggle<CR>", " Browser preview" },
    }
}, opts)

-- Install –  , Window = 
