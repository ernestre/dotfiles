require("neotest").setup({
    adapters = {
        require("neotest-golang")({
            testify_enabled = true,
        })
    }
})

map('n', '<Leader>TS', ":lua require('neotest').summary.toggle()<CR>")
map('n', '<Leader>TR', ":lua require('neotest').run.run()<CR>")
