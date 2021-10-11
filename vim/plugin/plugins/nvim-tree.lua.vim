lua <<EOF
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
EOF
