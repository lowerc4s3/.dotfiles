-- Set borders for floating windows
local orig_util_open_floating_preview = vim.lsp.util.open_floating_preview
function vim.lsp.util.open_floating_preview(contents, syntax, docopts, ...)
    docopts = docopts or {}
    docopts.border = "solid"
    -- docopts.width = 70
    return orig_util_open_floating_preview(contents, syntax, docopts, ...)
end

-- Set icons
local signs = { Error = " ", Warn = " ", Hint = " ", Info = " " }
for type, icon in pairs(signs) do
    local hl = "DiagnosticSign" .. type
    vim.fn.sign_define(hl, { text = icon, texthl = hl, numhl = hl })
end

vim.diagnostic.config({
    virtual_text = {
        prefix = '', -- ● • ■
    },
    update_in_insert = false,
    severety_sort = true,
})

-- Show diagnostics in floating window
vim.api.nvim_create_autocmd("CursorHold", {
    pattern = "*",
    callback = function()
        local opts = {
            focusable = false,
            close_events = { "BufLeave", "CursorMoved", "InsertEnter", "FocusLost" },
            border = 'solid',
            source = 'always',
            prefix = ' ',
            scope = 'cursor',
        }
        vim.diagnostic.open_float(nil, opts)
        -- vim.diagnostic.open_float(nil, {focus=false, scope="cursor"})
    end
})
