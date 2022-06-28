local g = vim.g

g.nvim_tree_git_hl = 1
g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

g.nvim_tree_show_icons = {
   folders = 1,
   files = 1,
   git = 1,
}

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
