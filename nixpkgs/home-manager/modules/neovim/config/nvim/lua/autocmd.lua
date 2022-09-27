vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = '*', command = '%s/\\s\\+$//e'
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = '*', command = 'lua vim.lsp.buf.formatting_sync(nil, 500)'
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = '*.go', command = 'GoImport'
})
