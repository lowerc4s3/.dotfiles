return {
    'folke/lazy.nvim',

    -- HACK: Plugin is deprecated because neovim fixed
    -- that performance bug, but still needed
    -- for decoupling updatetime from CursorHold event
    'antoinemadec/FixCursorHold.nvim',

    {
        -- A collection of various plugins.
        -- This is main spec, where the snacks.nvim is configured
        -- and plugins with no config are enabled
        "folke/snacks.nvim",
        lazy = false,
        priority = 999,
        opts = {}
    },

    {
        -- Session management
        'folke/persistence.nvim',
        event = 'BufReadPre',
        lazy = true,
        opts = {}
    },

    {
        -- Project manager (forked version of ahmedkhalf/project.nvim)
        "Zeioth/project.nvim",
        main = "project_nvim",
        lazy = false,
        opts = {
            patterns = { ".git", "Makefile", "makefile", "CMakeLists.txt", ".projectile" },
            detection_methods = { 'lsp', 'pattern' },
        }
    }
}
