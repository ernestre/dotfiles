let NERDTreeDirArrows=0
let g:rehash256 = 1
set backspace=2
set colorcolumn=121
set complete-=i
set completeopt-=preview
if has('mac')
    set guifont=Menlo\ for\ Powerline:h10
elseif has('unix')
    set guifont=Menlo\ for\ Powerline\ 7.5
endif
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
set synmaxcol=200  " syntax highlight only 200 chars"
set cursorline
set updatetime=400 " wait ms after stop typing to trigger scripts
set nowrap         " Don't wrap lines
set scrolloff=10   " scroll off padding
set hidden         " Allow buffer switching without saving
syntax on
" allow project specific .vimrc configurations {{
set exrc
set secure
" }}

vmap <C-C> "+y
vmap <C-X> "+x

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
Plug 'scrooloose/nerdtree'
Plug 'suan/vim-instant-markdown', { 'for': ['markdown','md'] }
Plug 'tpope/vim-repeat'
" Navigation
Plug 'kien/ctrlp.vim'
Plug 'junegunn/fzf', { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
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
Plug 'joonty/vdebug',          { 'for': 'php' }

Plug 'SirVer/ultisnips'
Plug 'craigemery/vim-autotag'
Plug 'ervandew/supertab'
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'w0rp/ale'
Plug 'terryma/vim-multiple-cursors'
Plug 'skwp/greplace.vim'
Plug 'mileszs/ack.vim'

" IDE : HTML/JS
Plug 'evidens/vim-twig'
Plug 'mattn/emmet-vim'
Plug 'pangloss/vim-javascript'
Plug 'maxmellon/vim-jsx-pretty'
" IDE : PHP
Plug 'arnaud-lb/vim-php-namespace',  { 'for': 'php' }
Plug 'sniphpets/sniphpets',          { 'for': 'php' }
Plug 'sniphpets/sniphpets-common',   { 'for': 'php' }
Plug 'sniphpets/sniphpets-doctrine', { 'for': 'php' }
Plug 'sniphpets/sniphpets-phpunit',  { 'for': 'php' }
Plug 'sniphpets/sniphpets-symfony',  { 'for': 'php' }
Plug 'tobyS/pdv',                    { 'for': 'php' }
Plug 'lvht/phpcd.vim',               { 'for': 'php' }
Plug 'tobyS/vmustache',              { 'for': 'php' } " Php Documentation  (requires ultiSnips)
Plug 'tomtom/tcomment_vim'
" Gist
Plug 'mattn/webapi-vim'
Plug 'mattn/gist-vim'

call plug#end()

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Settings
" ale
let g:ale_php_phpcs_standard = 'PSR2'
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
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0

" The Silver Searcher
if executable('ag')
  " Use ag over grep
  set grepprg=ag\ --nogroup\ --nocolor

  " Use ag in CtrlP for listing files. Lightning fast and respects .gitignore
  let g:ctrlp_user_command = 'ag %s -l --nocolor -g ""'
else
    set wildignore+=*/vendor/**
    set wildignore+=*/app/cache/**
    set wildignore+=*/app/logs/**
    set wildignore+=*/var/cache/**
    set wildignore+=*/var/logs/**
    set wildignore+=*/node_modules/**
endif


" Vim powerline
let g:airline#extensions#tabline#enabled = 1
let g:airline_powerline_fonts            = 1
let g:airline_theme                      = 'murmur'
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
" NerdTree
let NERDTreeIgnore = ['node_modules']

" https://github.com/joonty/vdebug#quick-guide
let g:vdebug_options         = {}
let g:vdebug_options["port"] = 9000
" Should be set in project specific .vimrc
" let g:vdebug_options["path_maps"]   = {
" \    '/var/www/vvs': '/project/vvs'
" \}

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

" Should be overridden in project specific .vimrc {{
function! RunPhpUnitForCurrentFile()
	execute ":echo 0"
endfunction

function! RunPhpUnit()
	execute ":echo 0"
endfunction
" }}

autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>P :CtrlPBufTag<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>
nnoremap <Leader>ct :call RunPhpUnitForCurrentFile()<CR>
nnoremap <Leader>t :call RunPhpUnit()<CR>

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

" Quick buffer switching
map <tab> :bn<cr>
map <s-tab> :bp<cr>
map gd :bd<cr>
