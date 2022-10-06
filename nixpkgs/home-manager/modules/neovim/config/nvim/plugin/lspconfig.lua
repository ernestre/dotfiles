require 'lspconfig'.intelephense.setup {}
require 'lspconfig'.jsonls.setup {}
require 'lspconfig'.pyright.setup {}
require 'lspconfig'.tsserver.setup {}
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
            ["build.experimentalWorkspaceModule"] = false,
            ["formatting.gofumpt"] = true,
            ["staticcheck"] = true,
            ["ui.verboseOutput"] = true,
        },
    },
}

require 'lspconfig'.golangci_lint_ls.setup {}

map('n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>')
map('n', '<leader>ci', '<Cmd>lua vim.lsp.buf.references()<CR>')
map('n', '<leader>r', '<Cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>cl', '<Cmd>lua vim.lsp.buf.formatting()<CR><CR>')
map('n', '<silent>K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<S-l>', '<Cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<S-h>', '<Cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', '<S-c>', '<Cmd>lua vim.diagnostic.setloclist()<CR>')