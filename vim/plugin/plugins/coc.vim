let g:coc_disable_startup_warning = 1

autocmd BufWritePre *.go :silent call CocAction('runCommand', 'editor.action.organizeImport')
