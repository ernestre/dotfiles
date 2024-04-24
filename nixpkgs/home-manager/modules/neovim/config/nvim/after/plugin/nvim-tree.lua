require 'nvim-tree'.setup {
    sort = { sorter = "case_sensitive" },
    view = {
        width = 30,
        adaptive_size = true,
    },
    renderer = {
        group_empty = true,
        highlight_git = true,
        root_folder_modifier = ":t",
        icons = {
            git_placement = "after",
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
                    unstaged = "",
                    staged = "",
                    unmerged = "",
                    renamed = "➜",
                    untracked = "",
                    deleted = "",
                    ignored = "◌",
                },
            },
        },
        indent_markers = {
            enable = true,
        },
    },
}

map('n', '<Leader>nt', ':NvimTreeToggle<CR>')
map('n', '<Leader>nf', ':NvimTreeFindFile<CR>')
