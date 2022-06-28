local g = vim.g

-- g.nvim_tree_root_folder_modifier = table.concat { ":t:gs?$?/..", string.rep(" ", 1000), "?:gs?^??" }

tree_cb = require'nvim-tree.config'.nvim_tree_callback

require'nvim-tree'.setup {
    update_focused_file = {
        enable = false,
        update_cwd = true,
    },
    renderer = {
        highlight_git = true,
        indent_markers = {
            enable = true,
        },
    },
    diagnostics = {
        enable = true,
        show_on_dirs = true,
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
