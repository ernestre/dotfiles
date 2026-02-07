local lazypath = vim.fn.stdpath("data") .. "/lazy/lazy.nvim"
if not vim.loop.fs_stat(lazypath) then
    vim.fn.system({
        "git", "clone", "--filter=blob:none",
        "https://github.com/folke/lazy.nvim.git",
        "--branch=stable", lazypath,
    })
end
vim.opt.rtp:prepend(lazypath)

require("lazy").setup({
    { "szw/vim-maximizer" },
    { "tpope/vim-surround" },
    { "tpope/vim-repeat" },
    { "tpope/vim-fugitive",            cmd = { "Git", "G", "Gvdiffsplit", "Gread", "Gwrite" } },
    { "junegunn/gv.vim",               cmd = "GV" },
    { "rhysd/committia.vim" },
    { "christoomey/vim-tmux-navigator" },
    { "mbbill/undotree",               cmd = "UndotreeToggle" },

    {
        "sainnhe/sonokai",
        lazy = false,
        priority = 1000,
        config = function()
            vim.g.sonokai_style = 'atlantis'
            vim.g.sonokai_transparent_background = true
            vim.cmd('colorscheme sonokai')
            vim.cmd('silent! hi SignColumn guibg=bg ctermbg=bg')
            vim.cmd('silent! hi GreenSign guibg=bg ctermbg=bg')
            vim.cmd('silent! hi BlueSign guibg=bg ctermbg=bg')
            vim.cmd('silent! hi RedSign guibg=bg ctermbg=bg')
            vim.cmd('silent! hi VirtualTextError guifg=Red ctermfg=Red')
            vim.cmd('sign define LspDiagnosticsSignError text=» texthl=LspDiagnosticsSignError linehl= numhl=')
            vim.cmd('sign define LspDiagnosticsSignWarning text=» texthl=LspDiagnosticsSignWarning linehl= numhl=')
            vim.cmd(
                'sign define LspDiagnosticsSignInformation text=» texthl=LspDiagnosticsSignInformation linehl= numhl=')
            vim.cmd('sign define LspDiagnosticsSignHint text=» texthl=LspDiagnosticsSignHint linehl= numhl=')
        end,
    },

    {
        "nvim-lualine/lualine.nvim",
        lazy = false,
        priority = 900,
        dependencies = { "nvim-tree/nvim-web-devicons" },
        config = function()
            local colors = {
                bg       = '#202328',
                fg       = '#bbc2cf',
                yellow   = '#ECBE7B',
                cyan     = '#008080',
                darkblue = '#081633',
                green    = '#98be65',
                orange   = '#FF8800',
                violet   = '#a9a1e1',
                magenta  = '#c678dd',
                blue     = '#51afef',
                red      = '#ec5f67',
            }
            local conditions = {
                buffer_not_empty = function() return vim.fn.empty(vim.fn.expand('%:t')) ~= 1 end,
                hide_in_width = function() return vim.fn.winwidth(0) > 80 end,
                check_git_workspace = function()
                    local filepath = vim.fn.expand('%:p:h')
                    local gitdir = vim.fn.finddir('.git', filepath .. ';')
                    return gitdir and #gitdir > 0 and #gitdir < #filepath
                end,
            }
            require('lualine').setup {
                options = {
                    icons_enabled = true,
                    theme = 'auto',
                    component_separators = '|',
                    section_separators = { left = '', right = '' },
                },
                sections = {
                    lualine_a = { 'mode' },
                    lualine_b = {
                        'branch',
                        { 'diff', symbols = { added = ' ', modified = '柳 ', removed = ' ' },
                            diff_color = { added = { fg = colors.green }, modified = { fg = colors.orange }, removed = { fg = colors.red } },
                            cond = conditions.hide_in_width },
                        { 'diagnostics', sources = { 'nvim_diagnostic' }, symbols = { error = ' ', warn = ' ', info = ' ' },
                            diagnostics_color = { error = { fg = colors.red }, warn = { fg = colors.yellow }, info = { fg = colors.cyan } } },
                    },
                    lualine_c = { { 'filename', path = 1 } },
                    lualine_x = {
                        'filetype',
                        { function()
                            local msg = 'No Active Lsp'
                            local buf_ft = vim.api.nvim_buf_get_option(0, 'filetype')
                            local clients = vim.lsp.get_active_clients()
                            if next(clients) == nil then return msg end
                            for _, client in ipairs(clients) do
                                local filetypes = client.config.filetypes
                                if filetypes and vim.fn.index(filetypes, buf_ft) ~= -1 then return client.name end
                            end
                            return msg
                        end, icon = '  LSP:', color = { fg = '#ffffff', gui = 'bold' } }
                    },
                    lualine_z = { 'location' }
                },
            }
        end,
    },

    {
        "nvim-telescope/telescope.nvim",
        tag = "0.1.8",
        dependencies = { "nvim-lua/plenary.nvim", "nvim-lua/popup.nvim", "nvim-telescope/telescope-fzf-native.nvim" },
        cmd = "Telescope",
        keys = {
            { "<Leader>f",  ":Telescope find_files<CR>" },
            { "<Leader>F",  ":Telescope find_files find_command=rg,--no-ignore,--hidden,--files,.<CR>" },
            { "<Leader>p",  ":Telescope git_files<CR>" },
            { "<Leader>gS", ":Telescope git_status<CR>" },
            { "<Leader>b",  ":Telescope buffers<CR>" },
            { "<Leader>l",  ":Telescope treesitter<CR>" },
            { "<Leader>gf", ":Telescope live_grep<CR>" },
        },
        config = function()
            require('telescope').setup {
                defaults = {
                    file_sorter = require('telescope.sorters').fuzzy_with_index_bias,
                    prompt_prefix = ' » ',
                    color_devicons = true,
                    file_previewer = require('telescope.previewers').vim_buffer_cat.new,
                    grep_previewer = require('telescope.previewers').vim_buffer_vimgrep.new,
                    qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
                },
                extensions = { fzf = { fuzzy = true, override_file_sorter = true, case_mode = "smart_case" } }
            }
            require('telescope').load_extension('fzf')
        end,
    },
    { "nvim-telescope/telescope-fzf-native.nvim", build = "make",                        lazy = true },

    {
        "ThePrimeagen/harpoon",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = {
            { "<leader>t",  [[<Cmd>lua require("harpoon.term").gotoTerminal(1)<CR>]] },
            { "<leader>1",  [[<Cmd>lua require("harpoon.ui").nav_file(1)<CR>]] },
            { "<leader>2",  [[<Cmd>lua require("harpoon.ui").nav_file(2)<CR>]] },
            { "<leader>3",  [[<Cmd>lua require("harpoon.ui").nav_file(3)<CR>]] },
            { "<leader>4",  [[<Cmd>lua require("harpoon.ui").nav_file(4)<CR>]] },
            { "<leader>5",  [[<Cmd>lua require("harpoon.ui").nav_file(5)<CR>]] },
            { "<leader>ha", [[<Cmd>lua require("harpoon.mark").add_file()<CR>]] },
            { "<leader>hq", [[<Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>]] },
        },
    },

    {
        "stevearc/oil.nvim",
        dependencies = { "nvim-tree/nvim-web-devicons" },
        keys = {
            { "-",          ":Oil<CR>" },
            { "<Leader>nt", ":Oil<CR>" },
            { "<Leader>nf", ":Oil<CR>" },
        },
        config = function()
            require("oil").setup({ delete_to_trash = true, skip_confirm_for_simple_edits = true })
        end,
    },

    {
        "sindrets/diffview.nvim",
        cmd = { "DiffviewOpen", "DiffviewClose", "DiffviewFileHistory" },
        keys = {
            { "<leader>do", ":DiffviewOpen<CR>" },
            { "<leader>dO", ":DiffviewClose<CR>" },
        },
        config = function()
            require("diffview").setup({ default_args = { DiffviewOpen = { "--imply-local" } } })
        end,
    },

    {
        "NeogitOrg/neogit",
        dependencies = { "nvim-lua/plenary.nvim", "sindrets/diffview.nvim", "nvim-telescope/telescope.nvim" },
        cmd = "Neogit",
        keys = { { "<Leader>gs", ":Neogit<CR>" } },
        config = function() require('neogit').setup { graph_style = "unicode" } end,
    },

    {
        "lewis6991/gitsigns.nvim",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            require('gitsigns').setup { current_line_blame = true }
            local map = vim.keymap.set
            map('n', '<Leader>gB', [[<Cmd>lua require"gitsigns".blame_line{full=true}<CR>]])
            map('n', 'gn', ':Gitsigns next_hunk<cr>')
            map('n', 'gp', ':Gitsigns prev_hunk<cr>')
            map('n', 'gu', ':Gitsigns reset_hunk<cr>')
            map('n', 'gP', ':Gitsigns preview_hunk_inline<cr>')
            map('n', 'ga', ':Gitsigns stage_hunk<cr>')
        end,
    },

    {
        "ruifm/gitlinker.nvim",
        dependencies = { "nvim-lua/plenary.nvim" },
        keys = { { "<leader>gy", mode = { "n", "v" } } },
        config = function()
            require("gitlinker").setup({ callbacks = { ["gitlab.com"] = require("gitlinker.hosts").get_gitlab_type_url } })
        end,
    },

    {
        "ernestre/git-worktree.nvim",
        dependencies = { "nvim-telescope/telescope.nvim" },
        cmd = "Telescope git_worktree",
        config = function()
            require("git-worktree").setup()
            require("telescope").load_extension("git_worktree")
        end,
    },

    {
        "neovim/nvim-lspconfig",
        tag = "v1.7.0",
        event = { "BufReadPre", "BufNewFile" },
        config = function()
            local lsp_utils = require("lspconfig.util")
            require('lspconfig').intelephense.setup {}
            require('lspconfig').jsonls.setup { init_options = { provideFormatter = false } }
            require('lspconfig').pyright.setup {}
            require('lspconfig').ts_ls.setup {
                settings = {
                    typescript = { format = { indentSize = 2 } },
                    javascript = { format = { indentSize = 2 } }
                }
            }
            require('lspconfig').terraformls.setup { filetypes = { "terraform", "terraform-vars", "hcl" } }
            require('lspconfig').yamlls.setup { settings = { yaml = { keyOrdering = false } } }
            require('lspconfig').lua_ls.setup {}
            require('lspconfig').nil_ls.setup { settings = { ['nil'] = { formatting = { command = { "nixpkgs-fmt" } } } } }
            require('lspconfig').gopls.setup {
                cmd = { "gopls" },
                settings = { gopls = { ["formatting.gofumpt"] = true, buildFlags = { "-tags=wireinject" } } },
            }
            require('lspconfig').marksman.setup {
                cmd = { "marksman", "server" },
                filetypes = { "markdown", "markdown.mdx", "vimwiki" },
                root_dir = lsp_utils.root_pattern(".git", ".marksman.toml"),
                single_file_support = true,
            }
            require('lspconfig').helm_ls.setup {}
            local map = vim.keymap.set
            map('n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>zz')
            map('n', '<leader>ci', '<Cmd>Telescope lsp_references<CR>')
            map('n', '<leader>r', '<Cmd>lua vim.lsp.buf.rename()<CR>')
            map('n', '<leader>cl', '<Cmd>lua vim.lsp.buf.formatting()<CR><CR>')
            map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
            map('n', '<S-l>', '<Cmd>lua vim.diagnostic.goto_next()<CR>')
            map('n', '<S-h>', '<Cmd>lua vim.diagnostic.goto_prev()<CR>')
            map('n', '<S-c>', '<Cmd>lua vim.diagnostic.setloclist()<CR>')
        end,
    },

    {
        "hrsh7th/nvim-cmp",
        event = "InsertEnter",
        dependencies = {
            "hrsh7th/cmp-nvim-lsp",
            "hrsh7th/cmp-buffer",
            "hrsh7th/cmp-path",
            "hrsh7th/cmp-calc",
            "saadparwaiz1/cmp_luasnip",
            "onsails/lspkind.nvim",
            "L3MON4D3/LuaSnip",
        },
        config = function()
            local cmp = require('cmp')
            local lspkind = require('lspkind')
            cmp.setup({
                snippet = { expand = function(args) require('luasnip').lsp_expand(args.body) end },
                formatting = {
                    format = lspkind.cmp_format {
                        with_text = true,
                        menu = { buffer = "[buf]", nvim_lsp = "[LSP]", path = "[path]", luasnip = "[snip]" },
                    }
                },
                mapping = {
                    ['<C-d>'] = cmp.mapping.scroll_docs(-4),
                    ['<C-f>'] = cmp.mapping.scroll_docs(4),
                    ['<C-j>'] = cmp.mapping.select_next_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<C-k>'] = cmp.mapping.select_prev_item({ behavior = cmp.SelectBehavior.Insert }),
                    ['<C-e>'] = cmp.mapping.close(),
                    ["<Tab>"] = cmp.mapping(function(fallback)
                        if cmp.visible() then
                            local entry = cmp.get_selected_entry()
                            if not entry then cmp.select_next_item({ behavior = cmp.SelectBehavior.Select }) end
                            cmp.confirm()
                        else
                            fallback()
                        end
                    end, { "i" }),
                },
                sources = cmp.config.sources({
                    { name = 'luasnip' },
                    { name = 'nvim_lsp' },
                    { name = 'path' },
                    { name = 'calc' },
                    {
                        name = 'buffer',
                        keyword_length = 3,
                        option = {
                            get_bufnrs = function()
                                return vim.api
                                    .nvim_list_bufs()
                            end
                        }
                    }
                }),
            })
        end,
    },

    {
        "L3MON4D3/LuaSnip",
        event = "InsertEnter",
        dependencies = { "rafamadriz/friendly-snippets" },
        config = function()
            require("luasnip.loaders.from_vscode").lazy_load()
            local ls = require("luasnip")
            vim.keymap.set({ "i" }, "<C-K>", function() ls.expand() end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-L>", function() ls.jump(1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-J>", function() ls.jump(-1) end, { silent = true })
            vim.keymap.set({ "i", "s" }, "<C-E>", function() if ls.choice_active() then ls.change_choice(1) end end,
                { silent = true })
        end,
    },



    {
        "utilyre/barbecue.nvim",
        event = { "BufReadPost", "BufNewFile" },
        dependencies = { "SmiteshP/nvim-navic", "nvim-tree/nvim-web-devicons" },
        config = function()
            require("barbecue").setup({ create_autocmd = false })
            vim.api.nvim_create_autocmd({ "WinResized", "BufWinEnter", "CursorHold", "InsertLeave", "BufModifiedSet" }, {
                group = vim.api.nvim_create_augroup("barbecue.updater", {}),
                callback = function() require("barbecue.ui").update() end,
            })
        end,
    },

    {
        "lukas-reineke/indent-blankline.nvim",
        event = { "BufReadPost", "BufNewFile" },
        main = "ibl",
        config = function()
            local highlight = { "RainbowRed", "RainbowYellow", "RainbowBlue", "RainbowOrange", "RainbowGreen",
                "RainbowViolet", "RainbowCyan" }
            local hooks = require("ibl.hooks")
            hooks.register(hooks.type.HIGHLIGHT_SETUP, function()
                vim.api.nvim_set_hl(0, "RainbowRed", { fg = "#E06C75" })
                vim.api.nvim_set_hl(0, "RainbowYellow", { fg = "#E5C07B" })
                vim.api.nvim_set_hl(0, "RainbowBlue", { fg = "#61AFEF" })
                vim.api.nvim_set_hl(0, "RainbowOrange", { fg = "#D19A66" })
                vim.api.nvim_set_hl(0, "RainbowGreen", { fg = "#98C379" })
                vim.api.nvim_set_hl(0, "RainbowViolet", { fg = "#C678DD" })
                vim.api.nvim_set_hl(0, "RainbowCyan", { fg = "#56B6C2" })
            end)
            require("ibl").setup({ indent = { highlight = highlight, char = "│" } })
        end,
    },

    {
        "numToStr/Comment.nvim",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require(
                'Comment').setup()
        end
    },
    {
        "windwp/nvim-autopairs",
        event = "InsertEnter",
        config = function()
            require(
                'nvim-autopairs').setup { check_ts = true }
        end
    },
    {
        "norcalli/nvim-colorizer.lua",
        event = { "BufReadPost", "BufNewFile" },
        config = function()
            require(
                'colorizer').setup()
        end
    },

    {
        "simrat39/symbols-outline.nvim",
        cmd = "SymbolsOutline",
        keys = { { "<leader>so", ":SymbolsOutline<CR>" } },
        config = function() require("symbols-outline").setup() end,
    },

    {
        "mfussenegger/nvim-dap",
        cmd = { "DapContinue", "DapToggleBreakpoint" },
        keys = {
            { "<Leader>db", ':lua require"dap".toggle_breakpoint()<CR>' },
            { "<Leader>dB", ':lua require"dap".set_breakpoint(vim.fn.input("Breakpoint condition: "))<CR>' },
            { "<Leader>dc", ':lua require"dap".continue()<CR>' },
            { "<Leader>dj", ':lua require"dap".step_over()<CR>' },
            { "<Leader>dl", ':lua require"dap".step_into()<CR>' },
            { "<Leader>dh", ':lua require"dap".step_out()<CR>' },
            { "<Leader>dr", ':lua require"dap".repl.open()<CR>' },
            { "<Leader>du", ':lua require"dapui".toggle()<CR>' },
            { "<Leader>dt", ':lua require"dap-go".debug_test()<CR>' },
        },
        dependencies = {
            "rcarriga/nvim-dap-ui",
            "theHamsta/nvim-dap-virtual-text",
            "leoluz/nvim-dap-go",
            "nvim-neotest/nvim-nio",
        },
        config = function()
            require('dapui').setup()
            require('nvim-dap-virtual-text').setup()
            require('dap-go').setup()
            local dap, dapui = require("dap"), require("dapui")
            dap.listeners.after.event_initialized["dapui_config"] = function() dapui.open() end
            dap.listeners.before.event_terminated["dapui_config"] = function() dapui.close() end
            dap.listeners.before.event_exited["dapui_config"] = function() dapui.close() end
            dap.adapters.php = { type = "executable", command = "node", args = { "/tmp/vscode-php-debug/out/phpDebug.js" } }
            dap.configurations.php = { { type = "php", request = "launch", name = "Listen for Xdebug", port = 9003, log = true } }
        end,
    },

    {
        "ray-x/go.nvim",
        ft = { "go", "gomod" },
        config = function() require('go').setup({ verbose = false }) end,
    },

    {
        "iamcco/markdown-preview.nvim",
        cmd = { "MarkdownPreviewToggle", "MarkdownPreview", "MarkdownPreviewStop" },
        ft = { "markdown" },
        build = function() vim.fn["mkdp#util#install"]() end,
    },

    {
        "MeanderingProgrammer/render-markdown.nvim",
        ft = { "markdown", "vimwiki" },
        dependencies = { "nvim-tree/nvim-web-devicons" },
    },

    { "reedes/vim-pencil",                        ft = { "markdown", "vimwiki", "text" } },
    { "dkarter/bullets.vim",                      ft = { "markdown", "vimwiki", "text" } },
    { "vimwiki/vimwiki",                          ft = { "vimwiki", "markdown" } },
    { "NoahTheDuke/vim-just",                     ft = "just" },
    { "jamessan/vim-gnupg" },
}, {
    performance = {
        rtp = {
            disabled_plugins = {
                "gzip", "matchit", "matchparen", "netrwPlugin", "tarPlugin", "tohtml", "tutor", "zipPlugin",
            },
        },
    },
})
