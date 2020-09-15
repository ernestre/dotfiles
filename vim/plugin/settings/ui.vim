silent! colorscheme sonokai

silent! hi SignColumn guibg=bg ctermbg=bg
silent! hi GreenSign guibg=bg ctermbg=bg
silent! hi BlueSign guibg=bg ctermbg=bg
silent! hi RedSign guibg=bg ctermbg=bg

"TODO: make plugin specific files and move these variables to the respective folder

let g:gitgutter_sign_added              = '┃'
let g:gitgutter_sign_modified           = '┃'
let g:gitgutter_sign_modified_removed   = '┃'
let g:gitgutter_sign_removed            = '▁▁'
let g:gitgutter_sign_removed_first_line = '▔▔'
let g:gitgutter_terminal_reports_focus = 0
let g:gitgutter_diff_args = '-w'
