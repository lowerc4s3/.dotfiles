local map = vim.keymap.set

vim.api.nvim_create_autocmd('LspAttach', {
    group = vim.api.nvim_create_augroup('kickstart-lsp-attach', { clear = true }),
    callback = function(event)
        local oa_opts = { silent = true, buffer = event.buf }
        map('n', 'gd', vim.lsp.buf.definition, oa_opts)
        map('n', 'K', vim.lsp.buf.hover, oa_opts)
        -- map('n', 'K', function() require("pretty_hover").hover() end, oa_opts)
        -- map('n', 'gD', vim.lsp.buf.declaration, oa_opts)
        -- map('n', 'gi', vim.lsp.buf.implementation, oa_opts)
        -- map('n', 'K', vim.lsp.buf.hover, oa_opts)
        -- map('n', '<C-k>', vim.lsp.buf.signature_help, oa_opts)

        -- require "lsp_signature".on_attach({
        --     handler_opts = { border = "solid" },
        --     hint_enable = false,
        -- })

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

vim.diagnostic.config({
    -- virtual_text = {
    --     prefix = '●', --  • ■
    -- },
    virtual_text = false, -- Disabled in favour of
    update_in_insert = false,
    severety_sort = true,
    signs = {
        text = {
            [vim.diagnostic.severity.ERROR] = "",
            [vim.diagnostic.severity.WARN] = "",
            [vim.diagnostic.severity.HINT] = "󰌶",
            [vim.diagnostic.severity.INFO] = "󰋽",
        },
        numhl = {
            [vim.diagnostic.severity.ERROR] = "DiagnosticSignError",
            [vim.diagnostic.severity.WARN] = "DiagnosticSignWarn",
            [vim.diagnostic.severity.HINT] = "DiagnosticSignHint",
            [vim.diagnostic.severity.INFO] = "DiagnosticSignInfo",
        }
    }
})

-- Set borders for floating windows
vim.lsp.util.open_floating_preview = (function(overriden)
    return function(contents, syntax, docopts, ...)
        docopts = docopts or {}
        docopts.border = "none"
        -- docopts.width = 70
        return overriden(contents, syntax, docopts, ...)
    end
end)(vim.lsp.util.open_floating_preview)

-- local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
-- function vim.lsp.util.open_floating_preview(contents, syntax, docopts, ...)
--     docopts = docopts or {}
--     docopts.border = "none"
--     -- docopts.width = 70
--     return orig_util_open_floating_preview(contents, syntax, docopts, ...)
-- end

-- Show diagnostics in floating window
-- vim.api.nvim_create_autocmd("CursorHold", {
--     pattern = "*",
--     callback = function()
--         local opts = {
--             focusable = false,
--             close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
--             border = 'solid',
--             source = 'always',
--             prefix = ' ',
--             scope = 'cursor',
--         }
--         vim.diagnostic.open_float(nil, opts)
--     end
-- })

-- -- Set icons
-- local signs = { Error = " ", Warn = " ", Hint = "󰌶 ", Info = "󰋽 " }
-- for type, icon in pairs(signs) do
--     local hl = "DiagnosticSign" .. type
--     vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
-- end
