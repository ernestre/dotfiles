call plug#begin('~/.vim/plugged')

" Plug 'Shougo/deoplete.nvim',             { 'do': ':UpdateRemotePlugins' }
Plug 'phpactor/phpactor' ,               { 'do': 'composer install', 'for': 'php'}
" Plug 'kristijanhusak/deoplete-phpactor'
Plug 'carlitux/deoplete-ternjs',         { 'do': 'npm install -g tern' }
" Plug 'mdempsky/gocode',                  { 'rtp': 'vim', 'do': '~/.vim/plugged/gocode/vim/symlink.sh' }
" Plug 'zchee/deoplete-go',                { 'do': 'make'}
" Plug 'zchee/deoplete-jedi'
" Plug 'kristijanhusak/vim-carbon-now-sh'

" ncm2 setup {{
Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'

autocmd BufEnter * call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'
Plug 'ncm2/ncm2-cssomni'
Plug 'ncm2/ncm2-tern',  {'do': 'npm install'}
Plug 'phpactor/ncm2-phpactor'

" }}


Plug 'tpope/vim-obsession'
Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'craigemery/vim-autotag'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', { 'for': 'go', 'do': ':GoInstallBinaries'  }
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf',                   { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'skwp/greplace.vim'
Plug 'sniphpets/sniphpets',            { 'for': 'php' }
Plug 'sniphpets/sniphpets-common',     { 'for': 'php' }
Plug 'sniphpets/sniphpets-doctrine',   { 'for': 'php' }
Plug 'sniphpets/sniphpets-phpunit',    { 'for': 'php' }
Plug 'sniphpets/sniphpets-symfony',    { 'for': 'php' }
Plug 'suan/vim-instant-markdown',      { 'for': ['markdown','md'] }
Plug 'tobyS/vmustache',                { 'for': 'php' }
Plug 'tomasr/molokai'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vim-airline/vim-airline'
Plug 'vim-airline/vim-airline-themes'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'
Plug 'majutsushi/tagbar'

call plug#end()
let g:vim_markdown_no_extensions_in_markdown = 1

let mapleader = ','

set guifont=DroidSansMono_Nerd_Font:h11

let NERDTreeDirArrows=0
let g:rehash256 = 1
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:¬
set backspace=2
set colorcolumn=121
set complete-=i
set encoding=utf-8
set expandtab             " On pressing tab, insert 4 spaces
set exrc                  " allow project specific .vimrc configurations {{
set guioptions-=L         " remove left-hand scroll bar
set guioptions-=T         " remove toolbar
set guioptions-=m         " remove menu bar
set guioptions-=r         " remove right-hand scroll bar
set hidden                " Allow buffer switching without saving
set laststatus=2          " Always show statusline
set lazyredraw            " will buffer screen updates instead of updating all the time
set list
set maxmempattern=20000   " increase max memory to show syntax highlighting for large files
set nobackup              " Don't create backup files
set nocompatible          " be iMproved, required
set nocursorcolumn
set noshowcmd
set noshowmode            " We show the mode with airline or lightline
set noswapfile            " Don't create swapfile
set nowrap                " Don't wrap lines
set number                " show line numbers
set relativenumber
set path+=**              " Look for files recursively
set pumheight=10          " Completion window max size
set regexpengine=1        " use old regex eninge since it's faster
set scrolloff=10          " scroll off padding
set shiftwidth=4          " when indenting with '>', use 4 spaces width
set noerrorbells
set splitright            " Open new splits on the right
set synmaxcol=200         " syntax highlight only 200 chars"
set t_Co=256              " Use 256 colours (Use this setting only if your terminal supports 256
set tabstop=4             " show existing tab with 4 spaces width
set ttyfast
set updatetime=1000       " wait ms after stop typing to trigger scripts
set cursorline
syntax on
syntax sync minlines=256  " start highlighting from 256 lines backwards
filetype plugin indent on
filetype on

colorscheme molokai

if (has("nvim"))
    set inccommand=nosplit
    tnoremap <Esc> <C-\><C-n>
endif

autocmd BufWritePre * %s/\s\+$//e " Remove white space on save.

" ========= Mappings =========
"
vmap <C-C> "+y
vmap <C-X> "+x

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

" avoid typos
command! WQ wq
command! Wq wq
command! W w
command! Wa wa
command! Wqa wqa
command! Q q

noremap <space> :set hlsearch! hlsearch?<CR> " Toggle hlsearch

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

nnoremap <Leader>d :call pdv#DocumentWithSnip()<CR>

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>p :GFiles<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>P :BTags<CR>
nnoremap <Leader>b :Buffers<CR>

" Fugitive
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gd :Gdiff<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Gstatus<CR>
nnoremap <Leader>gw :Gwrite<CR>

" Resize panes
nnoremap <C-l> :vertical resize -5<cr>
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>
nnoremap <C-h> :vertical resize +5<cr>

" Quick buffer switching
map gn :bn<cr>
map gp :bp<cr>
map gd :bd<cr>

" Golang mapping
nnoremap <Leader>glb :GoBuild<CR>
nnoremap <Leader>glr :GoRun<CR>

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" ========= Settings =========
"
let g:deoplete#enable_at_startup = 1
let g:deoplete#auto_complete_delay = 0

let g:instant_markdown_autostart = 0

let g:UltiSnipsSnippetDirectories=[
    \'UltiSnips',
    \$HOME.'/dotfiles/UltiSnips/general',
    \$HOME.'/dotfiles/UltiSnips/specific'
\]

" ale
let g:ale_php_phpcs_standard = 'PSR2'
let g:ale_linters = {'javascript': ['eslint'], 'php': ['phpcs', 'php', 'phpstan'] }
let g:ale_fixers = {
    \   'javascript': ['prettier', 'eslint'],
    \   'php': ['phpcbf'],
    \}
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

if executable("rg")
    set grepprg=rg
    let g:grep_cmd_opts = '--line-number --no-heading'
endif

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0

" The Silver Searcher
if executable('ag')
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
let g:airline_theme                      = 'deus'


" UltiSnips {
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit           = 'vertical'

" pdv
let g:pdv_template_dir = $HOME . '/.vim/plugged/pdv/templates_snip'

" NerdTree
let NERDTreeIgnore = ['node_modules']

" tags
let g:autotagTagsFile='tags'
set tags+=tags.vendors

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
hi! link Pmenu VisualNOS
" }

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:deplete#auto_complete_delay = 0
