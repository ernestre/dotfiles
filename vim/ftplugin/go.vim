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
