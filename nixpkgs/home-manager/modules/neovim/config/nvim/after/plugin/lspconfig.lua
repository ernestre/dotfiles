require 'lspconfig'.intelephense.setup {}
require 'lspconfig'.jsonls.setup {}
require 'lspconfig'.pyright.setup {}
require 'lspconfig'.tsserver.setup {
    cmd = {
        "/nix/store/6qb5xa7i3n5rd8p1dq4q1bp6pmcsqlla-typescript-language-server-2.1.0/bin/typescript-language-server",
        "--stdio",
        "--tsserver-path",
        "/nix/store/ws5saziayswil7dgx1ly6fqmrwrks26c-typescript-4.8.4/lib/node_modules/typescript/lib/"
    }
}
require 'lspconfig'.yamlls.setup {}
require 'lspconfig'.terraformls.setup {}
require 'lspconfig'.sumneko_lua.setup {}
require 'lspconfig'.rnix.setup {}
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
