require("oil").setup({
    -- Send deleted files to the trash instead of permanently deleting them (:help oil-trash)
    delete_to_trash = true,
    -- Skip the confirmation popup for simple operations (:help oil.skip_confirm_for_simple_edits)
    skip_confirm_for_simple_edits = true,
})
map('n', '-', ':Oil<CR>')
-- Breaking the muscle memory
map('n', '<Leader>nt', ':Oil<CR>')
map('n', '<Leader>nf', ':Oil<CR>')
