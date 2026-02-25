vim.lsp.config('intelephense', {})

vim.lsp.config('jsonls', {
    init_options = {
        provideFormatter = false
    }
})

vim.lsp.config('pyright', {})

vim.lsp.config('ts_ls', {
    settings = {
        typescript = {
            format = {
                indentSize = 2,
            }
        },
        javascript = {
            format = {
                indentSize = 2,
            }
        }
    }
})

vim.lsp.config('terraformls', {
    filetypes = { "terraform", "terraform-vars", "hcl" }
})

vim.lsp.config('helm_ls', {
    settings = {
        ['helm-ls'] = {
            yamlls = {
                path = "yaml-language-server",
            }
        }
    }
})

vim.lsp.config('yamlls', {
    settings = {
        yaml = {
            keyOrdering = false,
        }
    }
})

vim.lsp.config('lua_ls', {})

vim.lsp.config('nil_ls', {
    settings = {
        ['nil'] = {
            formatting = {
                command = { "nixpkgs-fmt" },
            },
        },
    },
})

vim.lsp.config('gopls', {
    cmd = { "gopls" },
    settings = {
        gopls = {
            ["formatting.gofumpt"] = true,
            ["ui.verboseOutput"] = true,
            buildFlags = { "-tags=wireinject" }
        },
    },
})

vim.lsp.config('golangci_lint_ls', {})

vim.lsp.config('marksman', {
    cmd = { "marksman", "server" },
    filetypes = { "markdown", "markdown.mdx", "vimwiki" },
    root_markers = { ".git", ".marksman.toml" },
})

vim.lsp.enable({
    'intelephense',
    'jsonls',
    'pyright',
    'ts_ls',
    'terraformls',
    'helm_ls',
    'yamlls',
    'lua_ls',
    'nil_ls',
    'gopls',
    'golangci_lint_ls',
    'marksman',
})

map('n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>zz')
map('n', '<leader>ci', '<Cmd>Telescope lsp_references<CR>')
map('n', '<leader>r', '<Cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>cl', '<Cmd>lua vim.lsp.buf.format()<CR>')
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<S-l>', '<Cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<S-h>', '<Cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', '<S-c>', '<Cmd>lua vim.diagnostic.setloclist()<CR>')
