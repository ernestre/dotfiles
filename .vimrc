let NERDTreeDirArrows=0
let g:rehash256 = 1
set backspace=2
set colorcolumn=121
set complete-=i
set cursorline
set expandtab           " On pressing tab, insert 4 spaces
set guifont=Menlo\ for\ Powerline:h10
set guioptions-=m  "remove menu bar
set guioptions-=T  "remove toolbar
set guioptions-=r  "remove right-hand scroll bar
set guioptions-=L  "remove left-hand scroll bar
set laststatus=2        " Always show statusline
set lazyredraw          " will buffer screen updates instead of updating all the time
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:¬
set nocompatible        " be iMproved, required
set number
set path+=**            " Look for files recursively
set shiftwidth=4        " when indenting with '>', use 4 spaces width
set splitright          " Open new splits on the right
set t_Co=256            " Use 256 colours (Use this setting only if your terminal supports 256
set tabstop=4           " show existing tab with 4 spaces width
set ttyfast
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

set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()

Plugin 'VundleVim/Vundle.vim'
" Git
Plugin 'Xuyuanp/nerdtree-git-plugin'
Plugin 'airblade/vim-gitgutter'
Plugin 'tpope/vim-fugitive'
" misc
Bundle 'myusuf3/numbers.vim'
Bundle 'scrooloose/nerdtree'
Plugin 'suan/vim-instant-markdown'
" Navigation
Bundle 'kien/ctrlp.vim'
Plugin 'easymotion/vim-easymotion'
" styles
Plugin 'godlygeek/csapprox'
Plugin 'hpoydar/vim-colors-ir-dark-gray'
Plugin 'tpope/vim-surround'
Plugin 'vim-airline/vim-airline'
Plugin 'vim-airline/vim-airline-themes'
" ide
Bundle 'arnaud-lb/vim-php-namespace'
Plugin 'terryma/vim-multiple-cursors'
Plugin 'SirVer/ultisnips'
Plugin 'Valloric/YouCompleteMe'
Plugin 'craigemery/vim-autotag'
Plugin 'ervandew/supertab'
Plugin 'evidens/vim-twig'
Plugin 'godlygeek/tabular'
Plugin 'honza/vim-snippets'
Plugin 'jiangmiao/auto-pairs'
Plugin 'mattn/emmet-vim'
Plugin 'mxw/vim-jsx'
Plugin 'pangloss/vim-javascript'
Plugin 'scrooloose/syntastic'
Plugin 'sniphpets/sniphpets'
Plugin 'sniphpets/sniphpets-doctrine'
Plugin 'sniphpets/sniphpets-phpunit'
Plugin 'sniphpets/sniphpets-symfony'
Plugin 'tobyS/pdv'
Plugin 'tobyS/vmustache' " Php Documentation  (requires ultiSnips)
Plugin 'tomtom/tcomment_vim'
" Gist
Plugin 'mattn/webapi-vim'
Plugin 'mattn/gist-vim'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

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
let g:pdv_template_dir = $HOME ."/.vim/bundle/pdv/templates_snip"
" Gist
let g:gist_detect_filetype         = 1
let g:gist_open_browser_after_post = 1
let g:gist_post_private            = 1
let g:gist_post_anonymous          = 1

nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>
" tags
let g:autotagTagsFile="tags"
set tags+=tags.vendors

if filereadable(glob('~/.vim/bundle/vim-colors-ir-dark-gray/colors/ir_dark_gray.vim'))
    colorscheme ir_dark_gray
endif

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
" Tabular
nmap <Leader>a= :Tabularize /=<CR>
vmap <Leader>a= :Tabularize /=<CR>
nmap <Leader>a> :Tabularize /=><CR>
vmap <Leader>a> :Tabularize /=><CR>
nmap <Leader>a: :Tabularize /:\zs<CR>
vmap <Leader>a: :Tabularize /:\zs<CR>
