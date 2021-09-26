set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua require'colorizer'.setup()
lua require'gitsigns'.setup{current_line_blame=true}
lua require'lspconfig'.gopls.setup{}
lua require'lspconfig'.intelephense.setup{}
lua require'lspconfig'.jsonls.setup{}
lua require'lspconfig'.pyright.setup{}
lua require'lspconfig'.tsserver.setup{}
lua require'lspconfig'.yamlls.setup{}
lua require'lspkind'.init()
