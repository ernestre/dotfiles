nmap <Leader>u :call phpactor#UseAdd()<CR>
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
nmap <Leader>nn :call phpactor#Navigate()<CR>
nmap <Leader>o :call phpactor#GotoDefinition()<CR>
nmap <Leader>tt :call phpactor#Transform()<CR>
nmap <Leader>cc :call phpactor#ClassNew()<CR>
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>

function! RunPhpUnitForCurrentFile()
    if filereadable('bin/phpunit')
        execute '!bin/phpunit %'
    else
        execute ':echo phpunit not found in ./bin'
    endif
endfunction

function! RunPhpUnit()
    if filereadable('bin/phpunit')
        execute '!bin/phpunit'
    else
        execute ':echo phpunit not found in ./bin'
    endif
endfunction

nnoremap <Leader>ct :call RunPhpUnitForCurrentFile()<CR>
nnoremap <Leader>t :call RunPhpUnit()<CR>
