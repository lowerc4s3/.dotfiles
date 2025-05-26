return {
    -- Completion engine
    "saghen/blink.cmp",
    dependencies = {
        -- "rafamadriz/friendly-snippets",     -- Snippets collection
        "xzbdmw/colorful-menu.nvim", -- Better completion item descriptions
        {
            -- Advanced snippet engine
            "L3MON4D3/LuaSnip",
            version = "v2.*",
            config = function()
                require("luasnip.loaders.from_vscode").lazy_load {
                    paths = { vim.fn.stdpath("config") .. '/snippets/vscode' }
                }
                require("luasnip.loaders.from_lua").lazy_load {
                    paths = { vim.fn.stdpath("config") .. '/snippets/luasnip' }
                }
                vim.keymap.set({ "i", "s" }, "<C-I>", function()
                    if require("luasnip").choice_active() then
                        require("luasnip").change_choice(1)
                    end
                end, { silent = true })
            end
        }
    },
    version = "1.*",
    event = { 'InsertEnter', 'CmdLineEnter' },
    opts = {
        keymap = {
            preset = "none",

            ["<C-b>"] = { "scroll_documentation_up", "fallback" },
            ["<C-f>"] = { "scroll_documentation_down", "fallback" },
            ["<C-e>"] = { "cancel", "fallback" },
            ["<Tab>"] = {
                function(cmp)
                    if cmp.is_visible() then
                        return cmp.select_next()
                    elseif cmp.snippet_active() then
                        return cmp.accept()
                    end
                    return false
                end,
                "snippet_forward",
                function(_)
                    -- HACK: Blink.cmp combined with LuaSnip somehow breaks tabout
                    -- unless we manually trigger the mapping
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(Tabout)", true, true, true), 'i', true)
                    return true
                end,
                -- Also tabout already handles fallback <Tab> mapping
                -- so we don't need to add "fallback" explicitly
            },
            ["<S-Tab>"] = {
                function(cmp)
                    if cmp.is_visible() then
                        return cmp.select_prev()
                    elseif cmp.snippet_active() then
                        return cmp.snippet_backward()
                    end
                    return false
                end,
                function(_)
                    vim.api.nvim_feedkeys(vim.api.nvim_replace_termcodes("<Plug>(TaboutBack)", true, true, true), 'i',
                        true)
                    return true
                end,
            },
            ["<CR>"] = { "select_and_accept", "fallback" }
        },
        appearance = {
            nerd_font_variant = "normal",
            kind_icons = {
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
        },
        completion = {
            documentation = {
                auto_show = true,
            },
            ghost_text = {
                enabled = false,
                show_without_menu = false
            },
            list = {
                selection = {
                    preselect = false,
                    auto_insert = true
                }
            },
            accept = {
                -- BUG: Enabling this causes buggy cursor jumps
                -- on Neovide v0.15.0 or earlier
                dot_repeat = false,
            },
            menu = {
                draw = {
                    padding = { 0, 1 },
                    columns = { { "kind_icon" }, { "label", gap = 1 } },
                    components = {
                        label = {
                            text = function(ctx)
                                return require("colorful-menu").blink_components_text(ctx)
                            end,
                            highlight = function(ctx)
                                return require("colorful-menu").blink_components_highlight(ctx)
                            end
                        },
                        kind_icon = {
                            text = function(ctx)
                                return " " .. ctx.kind_icon .. ctx.icon_gap
                            end
                        }
                    }
                }
            }
        },
        fuzzy = {
            implementation = "prefer_rust_with_warning"
        },
        sources = {
            default = function(_)
                -- Show buffer completions in comments
                local success, node = pcall(vim.treesitter.get_node)
                if success and node and vim.tbl_contains({ 'comment', 'line_comment', 'block_comment' }, node:type()) then
                    return { 'buffer' }
                end
                return { "snippets", "lazydev", "lsp" }
            end,
            providers = {
                lazydev = {
                    name = "LazyDev",
                    module = "lazydev.integrations.blink",
                    score_offset = 100,
                },
            }
            -- min_keyword_length = 1
        },
        snippets = { preset = 'luasnip' },
        cmdline = {
            keymap = {
                preset = "inherit",
                ["<CR>"] = { "select_accept_and_enter", "fallback" }
            },
            completion = {
                menu = {
                    auto_show = true
                },
                list = {
                    selection = {
                        preselect = false,
                        auto_insert = true
                    }
                },
                ghost_text = {
                    enabled = false
                }
            },
        },
    }
}
