local map = vim.keymap.set

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        local oa_opts = { silent = true, buffer = event.buf }
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

        -- Enable inlay hints if possible
        local client = vim.lsp.get_client_by_id(event.data.client_id)
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_inlayHint, event.buf) then
            vim.lsp.inlay_hint.enable(true)
        end

        -- Enable word references highlighting if possible
        if client and client:supports_method(vim.lsp.protocol.Methods.textDocument_documentHighlight, event.buf) then
            local highlight_augroup = vim.api.nvim_create_augroup('word-lsp-highlight', { clear = false })
            vim.api.nvim_create_autocmd({ 'CursorHold', 'CursorHoldI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.document_highlight,
            })

            vim.api.nvim_create_autocmd({ 'CursorMoved', 'CursorMovedI' }, {
                buffer = event.buf,
                group = highlight_augroup,
                callback = vim.lsp.buf.clear_references,
            })

            vim.api.nvim_create_autocmd('LspDetach', {
                group = vim.api.nvim_create_augroup('word-lsp-detach', { clear = true }),
                callback = function(event2)
                    vim.lsp.buf.clear_references()
                    vim.api.nvim_clear_autocmds { group = 'word-lsp-highlight', buffer = event2.buf }
                end,
            })
        end
    end,
})

vim.lsp.config('*', {
    capabilities = require('cmp_nvim_lsp').default_capabilities(vim.lsp.protocol.make_client_capabilities())
})

vim.lsp.config('clangd', {
    cmd = { "clangd", "--fallback-style=Microsoft" }
})

vim.lsp.config('gopls', {
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

-- Make runtime files discoverable to the server
local runtime_path = vim.split(package.path, ';')
table.insert(runtime_path, 'lua/?.lua')
table.insert(runtime_path, 'lua/?/init.lua')

vim.lsp.config('lua_ls', {
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
})

vim.lsp.enable({ 'bashls', 'cmake', 'rust_analyzer', 'texlab', 'basedpyright', 'tsserver', 'clangd', 'gopls', 'lua_ls' })
