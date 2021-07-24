" must have binaries installed, :GoInstallBinaries
let g:go_fmt_command = "goimports"
let g:go_auto_sameids = 1
let g:go_def_mode = 'godef'

function! RunCurrentFile()
    if executable('go')
        execute '!go run %'
    else
        execute 'go not available'
    endif
endfunction

nmap <Leader>r :call RunCurrentFile()<CR>

let b:commentary_format = '// %s'

lua <<EOF
  function goimports(timeout_ms)
    local context = { source = { organizeImports = true } }
    vim.validate { context = { context, "t", true } }

    local params = vim.lsp.util.make_range_params()
    params.context = context

    -- See the implementation of the textDocument/codeAction callback
    -- (lua/vim/lsp/handler.lua) for how to do this properly.
    local result = vim.lsp.buf_request_sync(0, "textDocument/codeAction", params, timeout_ms)
    if not result or next(result) == nil then return end
    local actions = result[1].result
    if not actions then return end
    local action = actions[1]

    -- textDocument/codeAction can return either Command[] or CodeAction[]. If it
    -- is a CodeAction, it can have either an edit, a command or both. Edits
    -- should be executed first.
    if action.edit then
      vim.lsp.util.apply_workspace_edit(action.edit)
    else
      vim.lsp.buf.execute_command(action)
    end
  end
EOF

autocmd BufWritePre *.go lua goimports(1000)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()

