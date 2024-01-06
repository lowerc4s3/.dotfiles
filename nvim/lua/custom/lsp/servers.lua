local M = {}

local lspconfig = require('lspconfig')
local map = vim.keymap.set

M.on_attach = function(_, bufnr)
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

M.capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())

local no_setup = { 'bashls', 'cmake', 'rust_analyzer', 'texlab' }
for _, server in ipairs(no_setup) do
    lspconfig[server].setup {
        on_attach = M.on_attach,
        capabilities = M.capabilities,
    }
end

lspconfig.pylsp.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    settings = {
        pylsp = {
            plugins = {
                jedi_completion = {
                    include_params = true, -- this line enables snippets
                    fuzzy = true
                },
            },
        },
    },
}

lspconfig.clangd.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
    cmd = { "clangd", "--fallback-style=Microsoft" }
}

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

-- lspconfig.sumneko_lua.setup {
lspconfig.lua_ls.setup {
    on_attach = M.on_attach,
    capabilities = M.capabilities,
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

return M
