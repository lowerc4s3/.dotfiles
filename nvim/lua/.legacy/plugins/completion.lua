return {
    -- Completion engine
    -- (disabled and replaced with blink.cmp)
    'hrsh7th/nvim-cmp',
    enabled = false,
    dependencies = {
        'rafamadriz/friendly-snippets',     -- General snippet collection
        'saadparwaiz1/cmp_luasnip',         -- luasnip support
        'hrsh7th/cmp-nvim-lsp',             -- lsp support
        'hrsh7th/cmp-buffer',               -- autocomplete from text
        'hrsh7th/cmp-path',                 -- path autocompletion
        'hrsh7th/cmp-cmdline',              -- cmdline autocompletion
        {
            -- Snippet engine
            'L3MON4D3/LuaSnip',
            build = "make install_jsregexp",
            config = function()
                require("luasnip").config.setup {
                    region_check_events = "CursorMoved",
                    delete_check_events = "TextChanged",
                }

                -- Add snippets from friendly snippets
                require("luasnip.loaders.from_vscode").lazy_load()
            end
        }
    },
    event = { 'InsertEnter', 'CmdLineEnter' },
    init = function()
        vim.g.completeopt = { 'menu', 'menuone', 'noselect' }
    end,
    config = function()
        local cmp = require('cmp')
        local compare = cmp.config.compare
        local luasnip = require('luasnip')
        local icons = {
            -- Codicons
            Text          = "",
            Method        = "",
            Function      = "",
            Constructor   = "",
            Field         = "",
            Variable      = "",
            Class         = "",
            Interface     = "",
            Module        = "",
            Property      = "",
            Unit          = "",
            Value         = "",
            Enum          = "",
            Keyword       = "",
            Snippet       = "",
            Color         = "",
            File          = "",
            Reference     = "",
            Folder        = "",
            EnumMember    = "",
            Constant      = "",
            Struct        = "",
            Event         = "",
            Operator      = "",
            TypeParameter = "",
        }

        cmp.setup {
            window = {
                documentation = {
                    maxheight = 15,
                    maxwidth = 50,
                },
                completion = {
                    col_offset = -3,
                    side_padding = 0,
                    winhighlight = "Normal:Pmenu,FloatBorder:FloatBorder,CursorLine:Visual,Search:None",
                },
            },

            -- Make completion appear after 2nd symbol
            completion = {
                keyword_length = 2,
            },

            formatting = {
                fields = { "kind", "abbr" },
                format = function(_, item)
                    item.kind = " " .. icons[item.kind] .. " "
                    return item
                end
            },

            snippet = {
                expand = function(args)
                    require('luasnip').lsp_expand(args.body)
                end,
            },

            -- Disable competion in comments
            enabled = function()
                if require "cmp.config.context".in_treesitter_capture("comment") == true or require "cmp.config.context".in_syntax_group("Comment") then
                    return false
                else
                    return true
                end
            end,

            mapping = cmp.mapping.preset.insert({
                ['<C-b>'] = cmp.mapping(cmp.mapping.scroll_docs(-4), { 'i', 'c' }),
                ['<C-f>'] = cmp.mapping(cmp.mapping.scroll_docs(4), { 'i', 'c' }),
                ['<C-Space>'] = cmp.mapping(cmp.mapping.complete(), { 'i', 'c' }),
                ['<C-y>'] = cmp.config.disable,
                ['<C-e>'] = cmp.mapping({
                    i = cmp.mapping.abort(),
                    c = cmp.mapping.close(),
                }),

                ['<Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_next_item()
                    elseif luasnip.expandable() then
                        luasnip.expand()
                    elseif luasnip.jumpable(1) then
                        luasnip.jump(1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),

                ['<S-Tab>'] = cmp.mapping(function(fallback)
                    if cmp.visible() then
                        cmp.select_prev_item()
                    elseif luasnip.jumpable(-1) then
                        luasnip.jump(-1)
                    else
                        fallback()
                    end
                end, { 'i', 's' }),
                ['<CR>'] = cmp.mapping.confirm { select = true },
            }),

            sources = cmp.config.sources({
                { name = 'nvim_lsp' },
                { name = 'luasnip' },
            }),

            -- Better comletion sorting
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
        }

        -- Use buffer source for `/` and '?'
        cmp.setup.cmdline({ '/', '?' }, {
            mapping = cmp.mapping.preset.cmdline(),
            completion = {
                keyword_length = 1,
            },
            sources = { { name = 'buffer' } }
        })

        -- Use cmdline & path source for ':'
        cmp.setup.cmdline(':', {
            mapping = cmp.mapping.preset.cmdline(),
            completion = {
                keyword_length = 1,
            },
            enabled = true,
            sources = cmp.config.sources {
                { name = 'path' },
                { name = 'cmdline' }
            }
        })
    end

}
