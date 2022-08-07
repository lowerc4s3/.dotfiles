local builtins = require("null-ls").builtins

require("null-ls").setup {
    sources = {
        -- builtins.code_actions.shellcheck.with({
        --     extra_filetypes = { "bash" }
        -- }),
        builtins.diagnostics.shellcheck.with({
            extra_filetypes = { "bash" }
        }),
        -- builtins.diagnostics.cppcheck
    }
}
