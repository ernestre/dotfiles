require('render-markdown').setup({
    file_types = { 'markdown', 'vimwiki' },
    render_modes = { 'n', 'c', 'i', 'v' },
})

vim.treesitter.language.register('markdown', 'vimwiki')
