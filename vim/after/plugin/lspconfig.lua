require'lspconfig'.intelephense.setup{}
require'lspconfig'.jsonls.setup{}
require'lspconfig'.pyright.setup{}
require'lspconfig'.tsserver.setup{
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
-- require'lspconfig'.yamlls.setup{}
require'lspconfig'.terraformls.setup{}

require'lspconfig'.gopls.setup{
  cmd = {"gopls"},
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

require'lspconfig'.golangci_lint_ls.setup{}
