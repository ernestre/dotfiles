require 'lspconfig'.intelephense.setup {}
require 'lspconfig'.jsonls.setup {}
require 'lspconfig'.pyright.setup {}
require 'lspconfig'.tsserver.setup {
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
}
require 'lspconfig'.terraformls.setup {
    filetypes = { "terraform", "terraform-vars", "hcl" }
}
require 'lspconfig'.yamlls.setup {
    settings = {
        yaml = {
            keyOrdering = false,
        }
    }
}
require 'lspconfig'.lua_ls.setup {}
require 'lspconfig'.nil_ls.setup {
    settings = {
        ['nil'] = {
            formatting = {
                command = { "nixpkgs-fmt" },
            },
        },
    },
}
require 'lspconfig'.gopls.setup {
    cmd = { "gopls" },
    log_level = vim.lsp.protocol.MessageType.Log,
    message_level = vim.lsp.protocol.MessageType.Log,
    settings = {
        gopls = {
            analyses = {
                fieldalignment = true,
            },
            ["formatting.gofumpt"] = true,
            ["ui.verboseOutput"] = true,
            buildFlags = { "-tags=wireinject" }
        },
    },
}
-- require 'lspconfig'.golangci_lint_ls.setup {}

map('n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>zz')
map('n', '<leader>ci', '<Cmd>Telescope lsp_references<CR>')
map('n', '<leader>r', '<Cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>cl', '<Cmd>lua vim.lsp.buf.formatting()<CR><CR>')
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<S-l>', '<Cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<S-h>', '<Cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', '<S-c>', '<Cmd>lua vim.diagnostic.setloclist()<CR>')
