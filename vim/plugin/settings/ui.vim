let g:sonokai_better_performance = 1
let g:sonokai_style = 'atlantis'

silent! colorscheme sonokai

silent! hi SignColumn guibg=bg ctermbg=bg
silent! hi GreenSign guibg=bg ctermbg=bg
silent! hi BlueSign guibg=bg ctermbg=bg
silent! hi RedSign guibg=bg ctermbg=bg

silent! hi CocErrorHighlight ctermfg=203 ctermbg=235 guifg=#fc5d7c guibg=bg gui=undercurl term=undercurl
silent! hi CocWarningHighlight ctermfg=179 ctermbg=236 guifg=#e7c664 guibg=#30323a gui=undercurl term=undercurl
silent! hi CocInfoHighlight ctermfg=110 ctermbg=235 guifg=#76cce0 guibg=bg gui=undercurl term=undercurl
silent! hi CocHintHighlight ctermfg=107 ctermbg=235 guifg=#9ed072 guibg=bg gui=undercurl term=undercurl
silent! hi VirtualTextError guifg=Red ctermfg=Red

sign define LspDiagnosticsSignError text=» texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=» texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=» texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=» texthl=LspDiagnosticsSignHint linehl= numhl=
