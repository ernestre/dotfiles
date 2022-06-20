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

" let &colorcolumn="80,".join(range(120,999),",")

hi Normal guibg=NONE ctermbg=NONE
hi Comment guibg=NONE ctermbg=NONE
hi Constant guibg=NONE ctermbg=NONE
hi Special guibg=NONE ctermbg=NONE
hi Identifier guibg=NONE ctermbg=NONE
hi Statement guibg=NONE ctermbg=NONE
hi PreProc guibg=NONE ctermbg=NONE
hi Type guibg=NONE ctermbg=NONE
hi Underlined guibg=NONE ctermbg=NONE
hi Todo guibg=NONE ctermbg=NONE
hi String guibg=NONE ctermbg=NONE
hi Function guibg=NONE ctermbg=NONE
hi Conditional guibg=NONE ctermbg=NONE
hi Repeat guibg=NONE ctermbg=NONE
hi Operator guibg=NONE ctermbg=NONE
hi Structure guibg=NONE ctermbg=NONE
hi LineNr guibg=NONE ctermbg=NONE
hi NonText guibg=NONE ctermbg=NONE
hi SignColumn guibg=NONE ctermbg=NONE
hi CursorLineNr guibg=NONE ctermbg=NONE
hi EndOfBuffer guibg=NONE ctermbg=NONE
