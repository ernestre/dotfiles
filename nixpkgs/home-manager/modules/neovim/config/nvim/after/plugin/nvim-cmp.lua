local cmp = require 'cmp'
local lspkind = require 'lspkind'

cmp.setup({
    -- snippet = {
    --     expand = function(args)
    --         -- require('luasnip').lsp_expand(args.body)
    --     end,
    -- },
    snippet = {
        expand = function(args)
            vim.fn["UltiSnips#Anon"](args.body)
        end,
    },
    formatting = {
        format = lspkind.cmp_format {
            with_text = true,
            menu = {
                buffer = "[buf]",
                nvim_lsp = "[LSP]",
                path = "[path]",
                luasnip = "[snip]",
            },
        }
    },
    mapping = {
        ['<C-d>'] = cmp.mapping.scroll_docs(-4),
        ['<C-f>'] = cmp.mapping.scroll_docs(4),
        ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
        ['<C-e>'] = cmp.mapping.close(),
        ["<Tab>"] = cmp.mapping(function(fallback)
            -- This little snippet will confirm with tab, and if no entry is selected, will confirm the first item
            if cmp.visible() then
                local entry = cmp.get_selected_entry()
                if not entry then
                    cmp.select_next_item({ behavior = cmp.SelectBehavior.Select })
                end
                cmp.confirm()
            else
                fallback()
            end
        end, { "i" }), -- Only work in insert mode, otherwise the command toggling is not working
    },
    sources = cmp.config.sources({
        { name = 'ultisnips' },
        -- { name = 'luasnip' },
        { name = 'nvim_lsp' },
        { name = 'path' },
        { name = 'calc' },
        {
            name = 'buffer',
            keyword_length = 3,
            option = {
                get_bufnrs = function()
                    return vim.api.nvim_list_bufs()
                end
            }
        }
    }),
    experimental = {
        native_menu = false,
        ghost_text = false,
    },
})
