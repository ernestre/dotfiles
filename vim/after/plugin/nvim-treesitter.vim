if &runtimepath =~ 'nvim-treesitter'
lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"json", "javascript", "jsdoc", "typescript", "go", "php", "html"},
  highlight = {
    enable = true,
  },
}
EOF
endif
