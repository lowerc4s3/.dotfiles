local cmp = require('cmp')
local compare = cmp.config.compare
local luasnip = require('luasnip')

luasnip.config.setup {
    region_check_events = "CursorMoved",
    delete_check_events = "TextChanged",
}

-- Add snippets from friendly snippets
require("luasnip.loaders.from_vscode").lazy_load()

vim.g.completeopt = { 'menu', 'menuone', 'noselect' }

-- local border = { "╭", "─", "╮", "│", "╯", "─", "╰", "│" }

cmp.setup {
    window = {
        documentation = {
            -- border = "solid",
            maxheight = 15,
            maxwidth = 50,
        },
        -- completion = {
        --     border = "solid",
        -- }
    },

    completion = {
        keyword_length = 2,
    },

    snippet = {
        expand = function(args)
            require('luasnip').lsp_expand(args.body)
        end,
    },

    mapping = cmp.mapping.preset.insert({
        ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
        ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
        ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
        ['<C-y>'] = cmp.config.disable,
        ['<C-e>'] = cmp.mapping({
            i = cmp.mapping.abort(),
            c = cmp.mapping.close(),
        }),

        ['<Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
                cmp.select_next_item()
            elseif luasnip.expandable() then
                luasnip.expand()
            elseif luasnip.jumpable(1) then
                luasnip.jump(1)
            else
                fallback()
            end
        end, {'i', 's'}),

        ['<S-Tab>'] = cmp.mapping(function (fallback)
            if cmp.visible() then
                cmp.select_prev_item()
            elseif luasnip.jumpable(-1) then
                luasnip.jump(-1)
            else
                fallback()
            end
        end, {'i', 's'}),
        ['<CR>'] = cmp.mapping.confirm({ select = true }),
    }),

    formatting = {
        format = require('lspkind').cmp_format({
            -- mode = 'symbol_text',
            mode = 'symbol',
            preset = 'default',
            symbol_map = {
                Function = "λ",
                Unit = "襁",
                Keyword = "", --
                Event = "",
                Text = "ﮜ"
            },
            maxwidth = 50,
        })
    },

    sources = cmp.config.sources({
        { name = 'nvim_lsp' },
        { name = 'luasnip' },
    }),

    sorting = {
        comparators = {
            compare.locality,
            compare.recently_used,
            compare.score,
            compare.offset,
            compare.order
        }
    },

    experimental = { ghost_text = true },

    enabled = function()
        if require"cmp.config.context".in_treesitter_capture("comment")==true or require"cmp.config.context".in_syntax_group("Comment") then
            return false
        else
            return true
    end
end
}

-- Use buffer source for `/`
cmp.setup.cmdline('/', {
    mapping = cmp.mapping.preset.cmdline(),
    completion = {
        keyword_length = 1,
    },
    enabled = true,
    sources = { { name = 'buffer' } }
})

-- Use buffer source for `?`
cmp.setup.cmdline('?', {
    mapping = cmp.mapping.preset.cmdline(),
    completion = {
        keyword_length = 1,
    },
    enabled = true,
    sources = { { name = 'buffer' } }
})

-- Use cmdline & path source for ':'
cmp.setup.cmdline(':', {
    mapping = cmp.mapping.preset.cmdline(),
    completion = {
        keyword_length = 1,
    },
    enabled = true,
    sources = cmp.config.sources({
        { name = 'path' },
        { name = 'cmdline' }
    })
})

-- Text = 
-- Method = 
-- Function = 
-- Constructor = 
-- Field = ﰠ
-- Variable = 
-- Class = ﴯ
-- Interface = 
-- Module = 
-- Property = ﰠ
-- Unit = 塞
-- Value = 
-- Enum = 
-- Keyword = 
-- Snippet = 
-- Color = 
-- File = 
-- Reference = 
-- Folder = 
-- EnumMember = 
-- Constant = 
-- Struct = פּ
-- Event = 
-- Operator = 
-- TypeParameter =
