require("diffview").setup({
    default_args = {
        -- https://github.com/sindrets/diffview.nvim/blob/main/USAGE.md#review-a-pr
        DiffviewOpen = { "--imply-local" },
    },
})



vim.keymap.set('n', '<leader>do', ":DiffviewOpen<CR>")
vim.keymap.set('n', '<leader>dO', ":DiffviewClose<CR>")
