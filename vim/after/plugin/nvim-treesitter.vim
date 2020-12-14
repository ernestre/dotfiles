lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"json", "javascript", "jsdoc", "typescript", "go", "php"},
  highlight = {
    enable = true,
  },
}
EOF
