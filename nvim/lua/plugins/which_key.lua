return {
    -- Mappings with mappings cheatsheet (not so nested anymore)
    'folke/which-key.nvim',
    opts = {
        preset = "classic",
        plugins = {
            presets = {
                operators = false,
                motions = false,
                text_objects = false,
                windows = false,
                nav = false,
                z = true,
                g = true,
            },
        },

        icons = {
            breadcrumb = "»",
            separator = "│",
            group = "",
            rules = false,
            colors = false
        },

        layout = {
            height = { min = 4, max = 25 },
            width = { min = 20, max = 50 },
            spacing = 8,
            align = "left",
        },

        show_help = true,

        spec = {
            silent = true,
            { "<leader>s", "<cmd>write<CR>", icon = "󰆓", desc = "Save" },
            { "<leader>S", "<cmd>wall<CR>", icon = "󰆔", desc = "Save all" },
            { "<leader>x", "<cmd>Bdelete<CR>", icon = "󰅘", desc = "Close buffer" },
            { "<leader>X", "<cmd>Bdelete!<CR>", icon = "󰅗", desc = "Force close buffer" },
            { "<leader>q", "<cmd>qa<CR>", icon = "󰗼", desc = "Quit" },
            { "<leader>Q", "<cmd>qa!<CR>", icon = "󰗼", desc = "Force quit" },
            { "<leader>/", "<cmd>NvimTreeFocus<cr>", icon = "󰙅", desc = "Open file tree" },
            { "<leader>.", "<cmd>Telescope file_browser<CR>", icon = "󰈞", desc = "Find files" },
            { "<leader>z", function() require("telescope").extensions.zoxide.list() end, icon = "󰉒", desc = "Change directory" },
            { "<leader><leader>", "<cmd>Telescope find_files<CR>", icon = "", desc = "Find project files" },

            { "<leader>b", group = "Buffers", icon = "" },
            { "<leader>bf", "<cmd>Telescope buffers<CR>", icon = "󰍉", desc = "Buffers" },
            { "<leader>bx", "<cmd>%Bdelete<cr>", icon = "󰱞", desc = "Close all" },
            { "<leader>bx", "<cmd>%Bdelete!<cr>", icon = "󰱝", desc = "Force close all" },

            { "<leader>f", group = "Find", icon = "󰍉" },
            { "<leader>ff", "<cmd>Telescope find_files<CR>", icon = "", desc = "Find project files" },
            { "<leader>fr", "<cmd>Telescope oldfiles<CR>", icon = "󰙰", desc = "Recent files" },
            { "<leader>fb", "<cmd>Telescope buffers<CR>", icon = "", desc = "Buffers" },
            { "<leader>fp", "<cmd>Telescope projects<CR>", icon = "", desc = "Projects" },
            { "<leader>fw", "<cmd>Telescope live_grep<CR>", icon = "󰈭", desc = "Word" },
            { "<leader>fd", "<cmd>Telescope file_browser<CR>", icon = "", desc = "Directory" },
            { "<leader>ft", "<cmd>TodoTelescope<CR>", icon = "󰄲", desc = "Todos" },

            { "<leader>g", group = "Git", icon = "" },
            { "<leader>gd", "<cmd>DiffviewOpen<CR>", icon = "", desc = "Open Diff" },
            { "<leader>gc", "<cmd>DiffviewClose<CR>", icon = "", desc = "Close Diff" },

            { "<leader>d", group = "Debug", icon = "" },
            { "<leader>db", "<cmd>DapContinue<cr>", icon = "", desc = "Start debugging" },
            { "<leader>dl", function() require('dap').run_last() end, icon = "󰑓", desc = "Run last" },
            { "<leader>di", "<cmd>DapStepInto<cr>", icon = "", desc = "Step into" },
            { "<leader>do", "<cmd>DapStepOver<cr>", icon = "", desc = "Step over" },
            { "<leader>dO", "<cmd>DapStepOut<cr>", icon = "", desc = "Step out" },
            { "<leader>ds", "<cmd>DapTerminate<cr>", icon = "󰝤", desc = "Stop debugging" },

            { "<leader>c", group = "Code", icon = "" },
            { "<leader>cD", "<cmd>Trouble diagnostics toggle<cr>", icon = "", desc = "Diagnostics (workspace)" },
            { "<leader>cd", "<cmd>Trouble diagnostics toggle filter.buf=0<cr>", icon = "", desc = "Diagnostics" },
            { "<leader>cf", function() vim.lsp.buf.format { async = true } end, icon = "󰅩", desc = "Format" },
            { "<leader>cr", "<cmd>Telescope lsp_references<CR>", icon = "󰏌", desc = "References" },
            -- { "<leader>ca", require("tiny-code-action").code_action, icon = "", desc = "Actions" },
            -- { "<leader>co", "<cmd>SymbolsOutline<CR>", icon = "󰙅", desc = "Symbols outline" },
            { "<leader>co", "<cmd>Outline<CR>", icon = "󰙅", desc = "Symbols outline" },
            { "<leader>cc", "<cmd>ColorizerToggle<cr>", icon = "", desc = "Toggle colorizer" },
            { "<leader>ct", "<cmd>TodoTrouble<CR>", icon = "󰄲", desc = "Todos" },

            { "<leader>C", group = "CMake", icon = "󰒓" },
            { "<leader>Cb", "<cmd>CMakeBuild<CR>", icon = "󰒓", desc = "Build project" },
            { "<leader>Cr", "<cmd>CMakeRun<CR>", icon = "", desc = "Run project" },
            { "<leader>Cd", "<cmd>CMakeDebug<CR>", icon = "", desc = "Start debugging" },
            { "<leader>Cc", "<cmd>CMakeClean<CR>", icon = "󰃢", desc = "Clean" },
            { "<leader>Cs", group = "Select", icon = "󰗇" },
            { "<leader>Csb", "<cmd>CMakeSelectBuildType<CR>", icon = "󰣖", desc = "Build type" },
            { "<leader>Cst", "<cmd>CMakeSelectLaunchTarget<CR>", icon = "󱤵", desc = "Launch target" },
            { "<leader>Csp", "<cmd>CMakeSelectBuildPreset<CR>", icon = "󱁻", desc = "Build preset" },

            { "<leader>p", group = "Packages", icon = "󰏓" },
            { "<leader>pc", "<cmd>Lazy check<CR>", icon = "󰄭", desc = "Check updates" },
            { "<leader>pC", "<cmd>Lazy clean<CR>", icon = "󰃢", desc = "Clean" },
            { "<leader>ps", "<cmd>Lazy sync<CR>", icon = "󰓦", desc = "Sync" },
            { "<leader>pi", "<cmd>Lazy install<CR>", icon = "", desc = "Install" },
            { "<leader>pl", "<cmd>Lazy log<CR>", icon = "󱒋", desc = "Log" },
            { "<leader>pp", "<cmd>Lazy<CR>", icon = "󰏓", desc = "Show" },
            { "<leader>pm", "<cmd>Mason<CR>", icon = "", desc = "Mason" },

            { "<leader>w", group = "Window", icon = "󰗘" },
            { "<leader>ws", "<C-w>s", icon = "󰇘", desc = "Horizontal split" },
            { "<leader>wv", "<C-w>v", icon = "󰇙", desc = "Vertical split" },
            { "<leader>wc", "<C-w>c", icon = "󰖭", desc = "Close" },
            { "<leader>wb", "<C-w>=", icon = "󰇼", desc = "Balance" },

            { "<leader>m", group = "Markdown", icon = "" },
            { "<leader>mp", "<cmd>Glow<CR>", icon = "󰂽", desc = "Preview" },
            { "<leader>mP", "<cmd>MarkdownPreviewToggle<CR>", icon = "󰂽", desc = "Browser preview" },
        }
    }
}
