function map(m, k, v)
    vim.keymap.set(m, k, v, { silent = true })
end

map('v', '<C-C>', '"+y')
map('v', '<C-X>', '"+x')

-- Search mappings: These will make it so that going to the next one in a
-- search will center on the line it's found in.
map('n', 'n', 'nzzzv')
map('n', 'N', 'Nzzzv')
map('n', 'J', 'mzJ`z')

map('i', ',', ',<c-g>u')
map('i', '.', '.<c-g>u')

-- Toggle hlsearch
map('n', '<space>', ':set hlsearch! hlsearch?<CR>')

map('n', '<C-s>', '<C-^>')

-- Paste in visual mode without copying
map('x', 'p', 'pgvy')

map('n', '<leader>ev', 'pgvy')

-- Avoid typos
vim.cmd('command! WQ wq')
vim.cmd('command! Wq wq')
vim.cmd('command! W w')
vim.cmd('command! Wa wa')
vim.cmd('command! Wqa wqa')
vim.cmd('command! Q q')

-- Reselect visual block after indent/outdent
map('v', '<', '<gv')
map('v', '>', '>gv')

-- Reselect visual block after indent/outdent
map('n', '<C-l>', ':vertical resize -5<cr>')
map('n', '<C-h>', ':vertical resize +5<cr>')
map('t', '<Esc>', [[<C-\><C-n>]])
