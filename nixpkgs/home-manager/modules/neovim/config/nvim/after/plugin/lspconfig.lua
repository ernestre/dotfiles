require 'lspconfig'.intelephense.setup {}
require 'lspconfig'.jsonls.setup {}
require 'lspconfig'.pyright.setup {}
require 'lspconfig'.tsserver.setup {
    cmd = {
        "/nix/store/1d031zaya21lq7n0q0naj1cd3632y1b5-typescript-language-server-2.1.0/bin/typescript-language-server",
        "--stdio",
        "--tsserver-path",
        "/nix/store/0d14rsfw1cxjqr106lbpblz8953wvi1i-typescript-4.9.5/lib/node_modules/typescript/lib/"
    }
}
require 'lspconfig'.yamlls.setup {}
require 'lspconfig'.terraformls.setup {
    filetypes = { "terraform", "terraform-vars", "hcl" }
}
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
require 'lspconfig'.golangci_lint_ls.setup {}

map('n', '<C-]>', '<Cmd>lua vim.lsp.buf.definition()<CR>zz')
map('n', '<leader>ci', '<Cmd>Telescope lsp_references<CR>')
map('n', '<leader>r', '<Cmd>lua vim.lsp.buf.rename()<CR>')
map('n', '<leader>cl', '<Cmd>lua vim.lsp.buf.formatting()<CR><CR>')
map('n', 'K', '<Cmd>lua vim.lsp.buf.hover()<CR>')
map('n', '<S-l>', '<Cmd>lua vim.diagnostic.goto_next()<CR>')
map('n', '<S-h>', '<Cmd>lua vim.diagnostic.goto_prev()<CR>')
map('n', '<S-c>', '<Cmd>lua vim.diagnostic.setloclist()<CR>')
