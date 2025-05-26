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
    ["s"] = { "<cmd>write<CR>", "󰆓 Save" },
    ["S"] = { "<cmd>wall<CR>", "󰆔 Save all" },
    ["x"] = { "<cmd>Bdelete<CR>", "󰅘 Close buffer" },
    ["X"] = { "<cmd>Bdelete!<CR>", "󰅗 Force close buffer" },
    ["q"] = { "<cmd>qa<CR>", "󰗼 Quit" },
    ["Q"] = { "<cmd>qa!<CR>", "󰗼 Force quit" },
    ["/"] = { "<cmd>NvimTreeFocus<cr>", "󰙅 Open file tree" },
    ["."] = { "<cmd>Telescope file_browser<CR>", "󰈞 Find files" },
    ["<leader>"] = { "<cmd>Telescope find_files<CR>", " Find project files" },

    f = {
        name = "󰍉 Find",
        ["f"] = { "<cmd>Telescope find_files<CR>", " Find project files" },
        ["r"] = { "<cmd>Telescope oldfiles<CR>", "󰙰 Recent files" },
        ["b"] = { "<cmd>Telescope buffers<CR>", " Buffers" },
        ["p"] = { "<cmd>Telescope projects<CR>", " Projects" },
        ["w"] = { "<cmd>Telescope live_grep<CR>", "󰈭 Word" },
        ["d"] = { "<cmd>Telescope file_browser<CR>", " Directory" },
        ["t"] = { "<cmd>TodoTelescope<CR>", "󰄲 List todos"},
    },

    g = {
        name = " Git",
        ["d"] = { "<cmd>DiffviewOpen<CR>", " Open Diff" },
        ["c"] = { "<cmd>DiffviewClose<CR>", " Close Diff" },
    },

    d = {
        name = ' Debug',
        ["b"] = { "<cmd>DapToggleBreakpoint<cr>", " Toggle breakpoint" },
        ["d"] = { "<cmd>DapContinue<cr>", " Start debugging" },
        ["l"] = { function() require('dap').run_last() end, "󰑓 Run last" },
        ["i"] = { "<cmd>DapStepInto<cr>", " Step into" },
        ["o"] = { "<cmd>DapStepOver<cr>", " Step over" },
        ["O"] = { "<cmd>DapStepOut<cr>", " Step out" },
        ["s"] = { "<cmd>DapTerminate<cr>", "󰝤 Stop debugging" },
    },

    c = {
        name = " Code",
        ["d"] = { "<cmd>Trouble<cr>", " Diagnostics" },
        ["r"] = { vim.lsp.buf.rename, "󰏫 Rename" },
        ["f"] = { function () vim.lsp.buf.format { async = true } end, "󰅩 Format" },
        ["R"] = { "<cmd>Telescope lsp_references<CR>", "󰏌 References" },
        ["a"] = { '<cmd>CodeActionMenu<CR>', " Actions" },
        ["o"] = { '<cmd>SymbolsOutline<CR>', '󰙅 Symbols outline' },
        ["c"] = { '<cmd>ColorizerToggle<cr>', " Toggle colorizer" },
        -- ["a"] = { '<cmd>lua vim.lsp.buf.code_action<CR>', " Actions" },
    },

    C = {
        name = "󰒓 CMake",
        ["b"] = { "<cmd>CMakeBuild<CR>", "󰒓 Build project" },
        ["r"] = { "<cmd>CMakeRun<CR>", " Run project" },
        ["d"] = { "<cmd>CMakeDebug<CR>", " Start debugging" },
        ["c"] = { "<cmd>CMakeClean<CR>", "󰃢 Clean" },
        ["s"] = {
            name = "󰗇 Select",
            ["b"] = { "<cmd>CMakeSelectBuildType<CR>", "󰣖 Build type" },
            ["t"] = { "<cmd>CMakeSelectLaunchTarget<CR>", "󱤵 Launch target" },
            ["p"] = { "<cmd>CMakeSelectBuildPreset<CR>", "󱁻 Build preset" },
        }
    },

    -- p = { "<cmd>Lazy<cr>", "󰏓 Packages" },

    p = {
        name = "󰏓 Packages",
        ["c"] = { "<cmd>Lazy check<CR>", "󰄭 Check updates" },
        ["C"] = { "<cmd>Lazy clean<CR>", "󰃢 Clean" },
        ["s"] = { "<cmd>Lazy sync<CR>", "󰓦 Sync" },
        ["i"] = { "<cmd>Lazy install<CR>", " Install" },
        ["l"] = { "<cmd>Lazy log<CR>", "󱒋 Log" },
        ["p"] = { "<cmd>Lazy<CR>", "󰏓 Show" },
    },

    -- p = {
    --     name = "󰏓 Packages",
    --     ["c"] = { "<cmd>PackerCompile<bar>LuaCacheClear<CR>", "󰒓 Compile" },
    --     ["C"] = { "<cmd>PackerClean<CR>", "󰃢 Clean" },
    --     ["i"] = { "<cmd>PackerInstall<CR>", " Install" },
    --     ["s"] = { "<cmd>PackerSync<CR>", " Sync" },
    --     ["S"] = { "<cmd>PackerStatus<CR>", "󰋽 Status" },
    --     ["u"] = { "<cmd>PackerUpdate<CR>", " Update" },
    --     ["r"] = { "<cmd>source %<CR>", "󰑓 Reload neovim file" }
    -- },

    w = {
        name = "󰗘 Window",
        ["s"] = { "<C-w>s", "󰇘 Horizontal split" },
        ["v"] = { "<C-w>v", "󰇙 Vertical split" },
        ["c"] = { "<C-w>c", "󰖭 Close" },
        ["b"] = { "<C-w>=", "󰇼 Balance" },
    },

    m = {
        name = " Markdown",
        ["p"] = { "<cmd>Glow<CR>", "󰂽 Preview" },
        ["P"] = { "<cmd>MarkdownPreviewToggle<CR>", "󰂽 Browser preview" },
    }
}, opts)

-- Install – 󰏔 , Window = 󰄷
