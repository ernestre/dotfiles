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
GoImports = function(timeoutms)
  local context = { source = { organizeImports = true } }
  vim.validate { context = { context, "t", true } }
  local params = vim.lsp.util.make_range_params()
  params.context = context
  local method = "textDocument/codeAction"
  local resp = vim.lsp.buf_request_sync(0, method, params, timeoutms)
  if resp and resp[1] then
    local result = resp[1].result
    if result and result[1] then
      local edit = result[1].edit
      vim.lsp.util.apply_workspace_edit(edit)
    end
  end
  vim.lsp.buf.formatting_sync()
end
EOF


autocmd BufWritePre *.go lua GoImports(1000)
autocmd BufWritePre *.go lua vim.lsp.buf.formatting()

