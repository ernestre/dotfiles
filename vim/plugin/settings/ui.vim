let g:sonokai_better_performance = 1
let g:sonokai_style = 'atlantis'

silent! colorscheme sonokai

silent! hi SignColumn guibg=bg ctermbg=bg
silent! hi GreenSign guibg=bg ctermbg=bg
silent! hi BlueSign guibg=bg ctermbg=bg
silent! hi RedSign guibg=bg ctermbg=bg

silent! hi VirtualTextError guifg=Red ctermfg=Red

sign define LspDiagnosticsSignError text=» texthl=LspDiagnosticsSignError linehl= numhl=
sign define LspDiagnosticsSignWarning text=» texthl=LspDiagnosticsSignWarning linehl= numhl=
sign define LspDiagnosticsSignInformation text=» texthl=LspDiagnosticsSignInformation linehl= numhl=
sign define LspDiagnosticsSignHint text=» texthl=LspDiagnosticsSignHint linehl= numhl=
