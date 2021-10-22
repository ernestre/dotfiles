local g = vim.g
g.nvim_tree_icons = {
   default = "",
   symlink = "",
   git = {
      deleted = "",
      ignored = "◌",
      renamed = "➜",
      staged = "✓",
      unmerged = "",
      unstaged = "✗",
      untracked = "★",
   },
   folder = {
      default = "",
      open = "",
      empty = "",
      empty_open = "",
      symlink = "",
      symlink_open = "",
   },
}

tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
    update_focused_file = {
        enable = false,
        update_cwd = true,
    },
    view = {
        mappings = {
            custom_only = false,
            list = {
                { key = "s", cb = tree_cb("vsplit") },
                { key = "i", cb = tree_cb("split") },
            }
        }
    }
}
