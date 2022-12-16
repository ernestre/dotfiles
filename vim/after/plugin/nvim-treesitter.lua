require'nvim-treesitter.configs'.setup {
  ensure_installed = {"json", "javascript", "jsdoc", "typescript", "go", "php", "hcl"},
  highlight = {
    enable = true,
  },
}