let NERDTreeDirArrows=0
let g:rehash256 = 1
set backspace=2
set colorcolumn=121
set complete-=i
set completeopt-=preview
set guifont=Menlo\ for\ Powerline:h10
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:¬
set nobackup       " Don't create backup files
set noswapfile     " Don't create swapfile
set pumheight=10   " Completion window max size
set expandtab      " On pressing tab, insert 4 spaces
set guioptions-=m  " remove menu bar
set guioptions-=T  " remove toolbar
set guioptions-=r  " remove right-hand scroll bar
set guioptions-=L  " remove left-hand scroll bar
set laststatus=2   " Always show statusline
set lazyredraw     " will buffer screen updates instead of updating all the time
set nocompatible   " be iMproved, required
set number         " show line numbers
set path+=**       " Look for files recursively
set shiftwidth=4   " when indenting with '>', use 4 spaces width
set splitright     " Open new splits on the right
set t_Co=256       " Use 256 colours (Use this setting only if your terminal supports 256
set tabstop=4      " show existing tab with 4 spaces width
set ttyfast
set nocursorcolumn " speed up syntax highlighting
set nocursorline
set updatetime=400 " wait ms after stop typing to trigger scripts
set nowrap         " Don't wrap lines
set scrolloff=10   " scroll off padding
set paste          " better pasting
syntax on

" map wq to avoid typos
command! WQ wq
command! Wq wq
command! W w
command! Q q

" Toggle hlsearch
noremap <space> :set hlsearch! hlsearch?<CR>

" Remove white space on save.
autocmd BufWritePre * %s/\s\+$//e

let mapleader = ','

" disable error bell {
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" }

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

filetype plugin indent on
filetype off

call plug#begin('~/.vim/plugged')

" Git
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'tpope/vim-fugitive'
" misc
Plug 'myusuf3/numbers.vim'
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown', { 'for': ['markdown','md'] }
Plug 'tpope/vim-repeat'
" Navigation
Plug 'kien/ctrlp.vim'
Plug 'easymotion/vim-easymotion'
" styles
Plug 'godlygeek/csapprox'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'tomasr/molokai'

" IDE
function! BuildYCM(info)
    " info is a dictionary with 3 fields
    " - name:   name of the plugin
    " - status: 'installed', 'updated', or 'unchanged'
    " - force:  set on PlugInstall! or PlugUpdate!
    if a:info.status == 'installed' || a:info.force
        !./install.py
    endif
endfunction
Plug 'Valloric/YouCompleteMe', { 'do': function('BuildYCM')  }

Plug 'SirVer/ultisnips'
Plug 'craigemery/vim-autotag'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'scrooloose/syntastic'
Plug 'terryma/vim-multiple-cursors'
Plug 'skwp/greplace.vim'
Plug 'mileszs/ack.vim'

" IDE : HTML/JS
Plug 'evidens/vim-twig'
Plug 'mattn/emmet-vim'
Plug 'mxw/vim-jsx',             { 'for': ['js', 'jsx'] }
Plug 'pangloss/vim-javascript', { 'for': ['js', 'jsx'] }
" IDE : PHP
Plug 'arnaud-lb/vim-php-namespace',  { 'for': 'php' }
Plug 'sniphpets/sniphpets',          { 'for': 'php' }
Plug 'sniphpets/sniphpets-doctrine', { 'for': 'php' }
Plug 'sniphpets/sniphpets-phpunit',  { 'for': 'php' }
Plug 'sniphpets/sniphpets-symfony',  { 'for': 'php' }
Plug 'tobyS/pdv',                    { 'for': 'php' }
Plug 'tobyS/vmustache',              { 'for': 'php' } " Php Documentation  (requires ultiSnips)
Plug 'tomtom/tcomment_vim'
" Gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

call plug#end()


set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Settings
" Syntastic
let g:syntastic_check_on_open       = 0
let g:syntastic_php_checkers        = ['php', 'phpcs', 'phpmd']
let g:syntastic_php_phpcs_args      = "--standard=PSR2"
let g:syntastic_javascript_checkers = ['jslint']
let g:syntastic_jsx_checkers        = ['jslint']
" Disable eclim's file validator
let g:EclimFileTypeValidate = 0
let g:EclimCompletionMethod = 'omnifunc'
" Gsearch
" Use AG for search
set grepprg=ag
let g:grep_cmd_opts = '--line-numbers --noheading'

" Ack
" Use Ag if possible
if executable('ag')
  let g:ackprg = 'ag --vimgrep'
endif

" CtrlP
set wildignore+=*/vendor/**
set wildignore+=*/app/cache/**
set wildignore+=*/app/logs/**
set wildignore+=*/var/cache/**
set wildignore+=*/var/logs/**
set wildignore+=*/node_modules/**
" Vim powerline
let g:airline_powerline_fonts=1
" YouCompleteMe
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']
" superTab
let g:SuperTabDefaultCompletionType = '<C-n>'
let g:SupereTabCrMapping            = 0
" UltiSnips {
let g:UltiSnipsExpandTrigger       = "<tab>"
let g:UltiSnipsJumpForwardTrigger  = "<tab>"
let g:UltiSnipsJumpBackwardTrigger = "<s-tab>"
let g:UltiSnipsEditSplit           = "vertical"
" pdv
let g:pdv_template_dir = $HOME ."/.vim/plugged/pdv/templates_snip"
" Gist
let g:gist_detect_filetype         = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private            = 1
let g:gist_post_anonymous          = 1
" JSX
" Syntax highlight and indent for js files
let g:jsx_ext_required = 0
" NerdTree
let NERDTreeIgnore = ['node_modules']

nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>
" tags
let g:autotagTagsFile="tags"
set tags+=tags.vendors

if filereadable(glob('~/.vim/plugged/molokai/colors/molokai.vim'))
    colorscheme molokai
endif

" Styling (use :hi for color reference): {
set linespace=2
" Line numbures should match the background color
hi LineNr guibg=bg ctermbg=bg
" Remove split borders
hi foldcolumn guibg=bg ctermbg=bg
hi VertSplit guibg=bg guifg=bg ctermbg=bg ctermfg=bg
" Tab styling
hi TabLine cterm=bold ctermfg=8 ctermbg=bg
hi TabLineFill cterm=bold ctermbg=bg
" GitGutter background should match the bg color
hi GitGutterAddDefault ctermfg=2 ctermbg=bg guifg=#009900 guibg=bg
hi GitGutterChangeDefault ctermfg=3 ctermbg=bg guifg=#bbbb00 guibg=bg
hi GitGutterDeleteDefault ctermfg=1 ctermbg=bg guifg=#ff2222 guibg=bg
" }

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction

autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>ct :!bin/phpunit -c app %<CR>
nnoremap <Leader>t :!bin/phpunit -c app <CR>

" Fugitive
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>

" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>

" Resize panes
nnoremap <C-l> :vertical resize -5<cr>
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>
nnoremap <C-h> :vertical resize +5<cr>
