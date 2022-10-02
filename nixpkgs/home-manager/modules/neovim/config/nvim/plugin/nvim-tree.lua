local g = vim.g

tree_cb = require 'nvim-tree.config'.nvim_tree_callback

require 'nvim-tree'.setup {
    update_focused_file = {
        enable = false,
        update_cwd = true,
    },
    renderer = {
        highlight_git = true,
        root_folder_modifier = ":t",
        icons = {
            glyphs = {
                default = "",
                symlink = "",
                folder = {
                    arrow_open = "",
                    arrow_closed = "",
                    default = "",
                    open = "",
                    empty = "",
                    empty_open = "",
                    symlink = "",
                    symlink_open = "",
                },
                git = {
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
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

map('n', '<Leader>nt', ':NvimTreeToggle<CR>')
map('n', '<Leader>nf', ':NvimTreeFindFile<CR>')
