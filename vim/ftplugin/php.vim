nmap <Leader>u :call phpactor#UseAdd()<CR>
nmap <Leader>mm :call phpactor#ContextMenu()<CR>
nmap <Leader>nn :call phpactor#Navigate()<CR>
nmap <Leader>tt :call phpactor#Transform()<CR>
nmap <Leader>cc :call phpactor#ClassNew()<CR>
nmap <silent><Leader>ee :call phpactor#ExtractExpression(v:false)<CR>
vmap <silent><Leader>ee :<C-U>call phpactor#ExtractExpression(v:true)<CR>
vmap <silent><Leader>em :<C-U>call phpactor#ExtractMethod()<CR>
nmap <Leader>e :call phpactor#GetClassFullName()<CR>

nmap <Leader>r :call RunCurrentFile()<CR>
function! RunCurrentFile()
    if executable('php')
        execute '!php %'
    else
        execute 'php not available'
    endif
endfunction

let b:commentary_format = '// %s'
