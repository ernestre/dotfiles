set runtimepath^=~/.vim runtimepath+=~/.vim/after
let &packpath = &runtimepath
source ~/.vimrc

lua require'lspconfig'.intelephense.setup{}
lua require'lspconfig'.gopls.setup{}
lua require'lspconfig'.tsserver.setup{}
lua require'lspkind'.init()
