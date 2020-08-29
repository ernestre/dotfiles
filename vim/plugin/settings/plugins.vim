let g:vim_markdown_no_extensions_in_markdown = 1
let mapleader = ','
let NERDTreeDirArrows=0
let g:rehash256 = 1

let g:instant_markdown_autostart = 0

let g:UltiSnipsSnippetDirectories=[
    \'UltiSnips',
    \$HOME.'/dotfiles/UltiSnips/general',
    \$HOME.'/dotfiles/UltiSnips/specific'
\]

if executable("rg")
    set grepprg=rg\ --color=never
    let g:grep_cmd_opts = '--line-number --no-heading'
endif

" UltiSnips {
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit           = 'vertical'

" NerdTree
let NERDTreeIgnore = ['node_modules']
let NERDTreeHighlightCursorline = 0

" tags
let g:autotagTagsFile='tags'
set tags+=tags.vendors

let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:deplete#auto_complete_delay = 0

let g:lightline = {}
let g:lightline.colorscheme = 'wombat'

" Fix true issue for vim: https://github.com/tmux/tmux/issues/1246
if exists('+termguicolors') && !has('macunix')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

let g:fzf_layout = { 'window': { 'width': 0.9, 'height': 0.9 } }
let $FZF_DEFAULT_OPTS="--ansi --preview-window 'right:60%' --layout reverse --margin=1,4 --preview 'bat --color=always --style=header,grid --line-range :300 {}'"

if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif

let g:coc_disable_startup_warning = 1
