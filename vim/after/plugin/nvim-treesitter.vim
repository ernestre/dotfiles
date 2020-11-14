lua <<EOF
require'nvim-treesitter.configs'.setup {
  ensure_installed = {"json", "typescript", "go", "php"},
  highlight = {
    enable = true,
  },
}
EOF
