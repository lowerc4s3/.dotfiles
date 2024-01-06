local lspconf = require("custom.lsp.servers")

require("clangd_extensions").setup {
    server = {
        on_attach = lspconf.on_attach,
        capabilities = lspconf.capabilities,
        cmd = { "clangd", "--fallback-style=Microsoft" }
    }
}
