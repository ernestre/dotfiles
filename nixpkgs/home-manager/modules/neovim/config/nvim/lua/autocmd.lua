vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = '*',
    callback = function()
        local ft = vim.bo.filetype

        if ft == "markdown" or ft == "vimwiki" then
            return
        end

        -- Remove leading empty lines
        vim.cmd([[%s/\%^\n//e]])
        -- Remove trailing empty lines
        vim.cmd([[%s/$\n\+\%$//e]])
        -- Remove trailing spaces
        vim.cmd([[%s/\s\+$//e]])
        -- Remove trailing "\r"
        vim.cmd([[%s/\r\+//e]])
    end
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = '*', command = 'lua vim.lsp.buf.format(nil, 500)'
})

vim.api.nvim_create_autocmd("BufWritePre", {
    pattern = '*.go', command = 'GoImport'
})

vim.api.nvim_create_autocmd("TermOpen", {
    pattern = '*', command = 'setlocal nospell'
})
