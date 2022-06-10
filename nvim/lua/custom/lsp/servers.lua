local lspconfig = require('lspconfig')
local map = vim.keymap.set

local on_attach = function(_, bufnr)
    local oa_opts = { silent = true, buffer = bufnr }
    map('n', 'gD', vim.lsp.buf.declaration, oa_opts)
    map('n', 'gd', vim.lsp.buf.definition, oa_opts)
    map('n', 'K', vim.lsp.buf.hover, oa_opts)
    map('n', 'gi', vim.lsp.buf.implementation, oa_opts)
    map('n', '<C-k>', vim.lsp.buf.signature_help, oa_opts)
    map('n', 'gr', vim.lsp.buf.references, oa_opts)

    require "lsp_signature".on_attach({
        handler_opts = { border = "solid" },
        hint_enable = false,
    })
end

local capabilities = require('cmp_nvim_lsp').update_capabilities(vim.lsp.protocol.make_client_capabilities())

local no_setup = { 'bashls', 'clangd' }
for _, server in ipairs(no_setup) do
    lspconfig[server].setup {
        on_attach = on_attach,
        capabilities = capabilities,
    }
end

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
