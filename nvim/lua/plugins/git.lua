return {
    {
        -- Git integration
        'lewis6991/gitsigns.nvim',
        event = { 'BufReadPre', 'BufNewFile' },
        dependencies = 'nvim-lua/plenary.nvim',
        opts = {}
    },

    {
        -- Cycle through modified files
        'sindrets/diffview.nvim',
        dependencies = 'nvim-lua/plenary.nvim',
        cmd = {
            'DiffviewOpen',
            'DiffviewClose',
            'DiffviewToggleFiles',
            'DiffviewFocusFiles',
            'DiffviewRefresh'
        },
        opts = {
            icons = {
                folder_closed = '󰉋',
                folder_open = '󰉋',
            },
            signs = {
                fold_closed = '',
                fold_open = '',
            },
            file_panel = {
                win_config = { width = 30 }
            }
        },
    },
}
