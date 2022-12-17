require 'gitsigns'.setup { current_line_blame = true }

map('n', '<Leader>gB', [[<Cmd>lua require"gitsigns".blame_line{full=true}<CR>]])
map('n', 'gn', ':Gitsigns next_hunk<cr>')
map('n', 'gp', ':Gitsigns prev_hunk<cr>')
map('n', 'gu', ':Gitsigns reset_hunk<cr>')
map('n', 'gP', ':Gitsigns preview_hunk_inline<cr>')
map('n', 'ga', ':Gitsigns stage_hunk<cr>')
