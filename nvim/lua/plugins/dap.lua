return {
    {
        -- Debug adapter protocol support
        'mfussenegger/nvim-dap',
        event = "VeryLazy",
        config = function()
            local dap = require("dap")

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

            local dapui = require("dapui")
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
        end
    },

    {
        -- VSCode-like DAP UI
        'rcarriga/nvim-dap-ui',
        dependencies = {
            'nvim-neotest/nvim-nio',
            'mfussenegger/nvim-dap',
        },
        cmd = {
            'CMakeDebug',
            'DapContinue',
            'DapSetLogLevel',
            'DapShowLog',
            'DapStepInto',
            'DapStepOut',
            'DapStepOver',
            'DapTerminate',
            'DapToggleBreakpoint',
            'DapToggleRepl',
        },
        opts = {
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
            floating = {
                max_height = nil,
                max_width = nil,
                border = "single",
                mappings = {
                    close = { "q", "<Esc>" },
                },
            },
            windows = { indent = 1 },
        }
    },

    {
        -- Python DAP configurations
        'mfussenegger/nvim-dap-python',
        dependencies = 'mfussenegger/nvim-dap',
        ft = 'python',
        cmd = {
            'DapContinue',
            'DapSetLogLevel',
            'DapShowLog',
            'DapStepInto',
            'DapStepOut',
            'DapStepOver',
            'DapTerminate',
            'DapToggleBreakpoint',
            'DapToggleRepl',
        },
        config = function()
            require('dap-python').setup('~/.virtualenvs/debugpy/bin/python')
        end
    }
}
