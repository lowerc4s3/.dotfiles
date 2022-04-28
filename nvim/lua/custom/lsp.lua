local lspconfig = require('lspconfig')

-- local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }
-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, docopts, ...)
--     docopts = docopts or {}
--     docopts.border = docopts.border or border
--     return orig_util_open_floating_preview(contents, syntax, docopts, ...)
-- end

-- Set icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '', -- Could be '●', '▎', 'x', '■'
    },
    update_in_insert = false,
    severety_sort = true,
})

-- Setup completion
local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

-- Mappings
local opts = { silent = true }
local map = vim.keymap.set

map('n', '[d', vim.diagnostic.goto_prev, opts)
map('n', ']d', vim.diagnostic.goto_next, opts)

local on_attach = function(client, bufnr)
    local oa_opts = { silent = true, buffer = bufnr }
    map('n', 'gD', vim.lsp.buf.declaration, oa_opts)
    map('n', 'gd', vim.lsp.buf.definition, oa_opts)
    map('n', 'K', vim.lsp.buf.hover, oa_opts)
    map('n', 'gi', vim.lsp.buf.implementation, oa_opts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, oa_opts)
    map('n', 'gr', vim.lsp.buf.references, oa_opts)

    require "lsp_signature".on_attach({
        handler_opts = { border = "none" },
        hint_enable = false,
    })
end

-- Show diagnostics in floating window
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function ()
        vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
    end
})

-- LS Setup
lspconfig.bashls.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.clangd.setup {
    on_attach = on_attach,
    capabilities = capabilities
}

lspconfig.pylsp.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        pylsp = {
            plugins = {
                jedi_completion = {
                    include_params = true,  -- this line enables snippets
                    fuzzy = true
                },
            },
        },
    },
}

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

lspconfig.sumneko_lua.setup {
    on_attach = on_attach,
    capabilities = capabilities,
    settings = {
        Lua = {
            runtime = {
                version = 'LuaJIT',
                path = runtime_path,
            },
            workspace = {
                library = vim.api.nvim_get_runtime_file('', true),
            },
            diagnostics = { globals = { 'vim' } },
            telemetry = { enable = false },
        }
    }
}
