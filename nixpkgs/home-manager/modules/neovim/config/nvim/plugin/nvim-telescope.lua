require('telescope').setup {
    defaults = {
        file_sorter = require('telescope.sorters').fuzzy_with_index_bias,
        prompt_prefix = ' » ',
        color_devicons = true,

        file_previewer   = require('telescope.previewers').vim_buffer_cat.new,
        grep_previewer   = require('telescope.previewers').vim_buffer_vimgrep.new,
        qflist_previewer = require('telescope.previewers').vim_buffer_qflist.new,
    },
    extensions = {
        fzf = {
            fuzzy = true,                    -- false will only do exact matching
            override_generic_sorter = false, -- override the generic sorter
            override_file_sorter = true,     -- override the file sorter
            case_mode = "smart_case",        -- or "ignore_case" or "respect_case"
                                             -- the default case_mode is "smart_case"
        }
    }
}

require('telescope').load_extension('fzf')

map('n', '<Leader>f', ':Telescope find_files<CR>')
map('n', '<Leader>F', ':Telescope find_files find_command=rg,--no-ignore,--hidden,--files,.<CR>')
map('n', '<Leader>p', ':Telescope git_files<CR>')
map('n', '<Leader>gS', ':Telescope git_status<CR>')
map('n', '<Leader>b', ':Telescope buffers<CR>')
map('n', '<Leader>l', ':Telescope treesitter<CR>')
map('n', '<Leader>gf', ':Telescope live_grep<CR>')
