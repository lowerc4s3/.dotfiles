local dap = require("dap")
local dapui = require("dapui")

dap.adapters.lldb = {
    type = 'executable',
    command = '/usr/local/opt/llvm/bin/lldb-vscode',
    name = "lldb"
}

dap.adapters.delve = {
    type = 'server',
    port = '${port}',
    executable = {
        command = 'dlv',
        args = { 'dap', '-l', '127.0.0.1:${port}' },
    }
}

dap.configurations.cpp = {
    {
        name = 'Launch',
        type = 'lldb',
        request = 'launch',
        program = function()
            return vim.fn.input('Path to executable: ', vim.fn.getcwd() .. '/', 'file')
        end,
        cwd = '${workspaceFolder}',
        stopOnEntry = false,
        args = {},
    }
}

dap.configurations.go = {
    {
        type = "delve",
        name = "Debug",
        request = "launch",
        program = "${file}"
    },
}

dap.configurations.c = dap.configurations.cpp

vim.fn.sign_define('DapBreakpoint', {
    text = '',
    texthl = 'DiagnosticSignError',
    linehl = '',
    numhl =
    'DiagnosticSignError'
})
vim.fn.sign_define('DapStopped', { text = '󰁔', texthl = '', linehl = 'CursorLine', numhl = '' })
vim.fn.sign_define('DapBreakpointCondition', { text = '󰁔', texthl = '', linehl = 'CursorLine', numhl = '' })

dap.defaults.fallback.focus_terminal = true

-- Setup dapui
dapui.setup({
    icons = { expanded = "󰅀", collapsed = "󰅂" },
    mappings = {
        expand = { "<CR>", "<2-LeftMouse>" },
        open   = "o",
        remove = "d",
        edit   = "e",
        repl   = "r",
    },
    layouts = {
        {
            elements = {
                'scopes',
                'breakpoints',
                'stacks',
                'watches',
            },
            size = 40,
            position = 'left',
        },
        {
            elements = {
                'repl',
                'console',
            },
            size = 10,
            position = 'bottom',
        },
    },
    --[[ sidebar = {
        -- You can change the order of elements in the sidebar
        elements = {
            -- Provide as ID strings or tables with "id" and "size" keys
            { id = "scopes", size = 0.5, },
            -- { id = "breakpoints", size = 0.25 },
            -- { id = "repl", size = 0.25 },
            { id = "breakpoints", size = 0.5 },
            -- { id = "repl", size = 0.25 },

            -- { id = "stacks", size = 0.25 },
            -- { id = "watches", size = 0.25 },
        },
        size = 40,
        position = "right", -- Can be "left", "right", "top", "bottom"
    },
    tray = {
        elements = { "repl", "console" },
        size = 5,
        position = "bottom", -- Can be "left", "right", "top", "bottom"
    }, ]]
    floating = {
        max_height = nil,  -- These can be integers or a float between 0 and 1.
        max_width = nil,   -- Floats will be treated as percentage of your screen.
        border = "single", -- Border style. Can be "single", "double" or "rounded"
        mappings = {
            close = { "q", "<Esc>" },
        },
    },
    windows = { indent = 1 },
})

dap.listeners.after.event_initialized["dapui_config"] = function()
    dapui.open()
end
dap.listeners.before.event_terminated["dapui_config"] = function()
    dapui.close()
end
dap.listeners.before.event_exited["dapui_config"] = function()
    dapui.close()
    dap.repl.close()
end
