if executable("rg")
    set grepprg=rg\ --color=never
    let g:grep_cmd_opts = '--line-number --no-heading'
endif
