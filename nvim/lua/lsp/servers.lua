local lsp = vim.lsp

lsp.config('gopls', {
    settings = {
        gopls = {
            ["ui.inlayhint.hints"] = {
                compositeLiteralFields = true,
                constantValues = true,
                parameterNames = true
            },
        }
    }
})

lsp.config('rust_analyzer', {
    settings = {
        ["rust-analyzer"] = {
            inlayHints = {
                typeHints = false,
                chainingHints = false,
                parameterHints = false,
                closingBraceHints = false,
            },
            check = {
                command = "clippy"
            }
        }
    }
})

lsp.config('jsonls', {
    settings = {
        json = {
            schemas = require("schemastore").json.schemas(),
            validate = { enable = true },
        }
    }
})

lsp.enable({
    'bashls',
    'cmake',
    'rust_analyzer',
    'texlab',
    'basedpyright',
    'tsserver',
    'clangd',
    'gopls',
    'lua_ls',
    'jsonls'
})
