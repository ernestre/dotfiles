silent! colorscheme sonokai

silent! hi    LineNr            guibg=bg        ctermbg=bg
silent! hi    SignColumn        guibg=bg        ctermbg=bg
silent! hi    foldcolumn        guibg=bg        ctermbg=bg
silent! hi    VertSplit         guibg=bg        guifg=bg        ctermbg=bg      ctermfg=bg
silent! hi    TabLine           cterm=bold      ctermfg=8       ctermbg=bg
silent! hi    TabLineFill       cterm=bold      ctermbg=bg
" silent! hi    GitGutterAdd      ctermfg=2       ctermbg=bg      guifg=#009900   guibg=bg
" silent! hi    GitGutterChange   ctermfg=3       ctermbg=bg      guifg=#bbbb00   guibg=bg
" silent! hi    GitGutterDelete   ctermfg=1       ctermbg=bg      guifg=#ff2222   guibg=bg
" silent! hi!   link              Pmenu           VisualNOS
" silent! hi    DiffText          gui=none,bold   guibg=#4C4745
" silent! hi    Macro             gui=none        guifg=#C4BE89
" silent! hi    SpecialKey        gui=none        guifg=#66D9EF
" silent! hi    Special           gui=none        guifg=#66D9EF   guibg=bg
" silent! hi    StorageClass      gui=none        guifg=#FD971F
" silent! hi    Tag               gui=none        guifg=#F92672
silent! hi    NonText           guifg=bg


let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_modified_removed   = '┃'
let g:gitgutter_sign_removed            = '▁▁'
let g:gitgutter_sign_removed_first_line = '▔▔'

let &colorcolumn="80,".join(range(120,999),",")
