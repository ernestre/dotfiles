nmap <Leader>r :call RunCurrentFile()<CR>

function! RunCurrentFile()
    if executable('docker')
        execute '!docker build -t tmp . && docker run --rm tmp'
    else
        execute 'docker not available'
    endif
endfunction
