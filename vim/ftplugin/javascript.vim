setlocal ts=2 sts=2 sw=2

nmap <Leader>r :call RunCurrentFile()<CR>

function! RunCurrentFile()
    if executable('node')
        execute '!node %'
    else
        execute 'node not available'
    endif
endfunction
