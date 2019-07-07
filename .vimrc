call plug#begin('~/.vim/plugged')

Plug 'ncm2/ncm2'
Plug 'roxma/nvim-yarp'
Plug 'phpactor/ncm2-phpactor'
Plug 'ncm2/ncm2-bufword'
Plug 'ncm2/ncm2-path'

autocmd BufEnter  *  call ncm2#enable_for_buffer()
set completeopt=noinsert,menuone,noselect

Plug 'autozimu/LanguageClient-neovim', {
    \ 'branch': 'next',
    \ 'do': 'bash install.sh',
    \ }

nnoremap <F5> :call LanguageClient_contextMenu()<CR>


nmap <C-]> :call LanguageClient#textDocument_definition()<CR>
nmap <leader>h :call LanguageClient#textDocument_hover()<CR>
nmap <leader>l :call LanguageClient_textDocument_formatting()<CR>
nmap <leader>i :call LanguageClient_textDocument_references()<CR>

let g:LanguageClient_serverCommands = {}

" npm i -g javascript-typescript-stdio
let g:LanguageClient_serverCommands.javascript = ['javascript-typescript-stdio']

" npm i -g intelephense
let g:LanguageClient_serverCommands.php = ['intelephense', '--stdio']

" https://github.com/sourcegraph/go-langserver
" go get -u github.com/sourcegraph/go-langserver
let g:LanguageClient_serverCommands.go = ['go-langserver', '-gocodecompletion']


Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'Yggdroot/indentLine'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go',                                 { 'for': 'go', 'do': ':GoInstallBinaries'  }
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf',                                 { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'kien/ctrlp.vim'
Plug 'majutsushi/tagbar'
Plug 'mattn/emmet-vim'
Plug 'maxmellon/vim-jsx-pretty'
Plug 'pangloss/vim-javascript'
Plug 'phpactor/phpactor',                            { 'do': 'composer install', 'for': 'php'}
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'skwp/greplace.vim'
Plug 'sniphpets/sniphpets',                          { 'for': 'php' }
Plug 'sniphpets/sniphpets-common',                   { 'for': 'php' }
Plug 'sniphpets/sniphpets-doctrine',                 { 'for': 'php' }
Plug 'sniphpets/sniphpets-phpunit',                  { 'for': 'php' }
Plug 'sniphpets/sniphpets-symfony',                  { 'for': 'php' }
Plug 'suan/vim-instant-markdown',                    { 'for': ['markdown','md'] }
Plug 'tobyS/vmustache',                              { 'for': 'php' }
Plug 'tomasr/molokai'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-obsession'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'w0rp/ale'

call plug#end()
let g:vim_markdown_no_extensions_in_markdown = 1

let mapleader = ','

let NERDTreeDirArrows=0
let g:rehash256 = 1
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:¬
set backspace=2
set colorcolumn=81
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

" Edit or source .vimrc
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" Avoid typos
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

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>p :CtrlP<CR>
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>P :CtrlPBufTag<CR>
nnoremap <Leader>b :CtrlPBuffer<CR>

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

" set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" ========= Settings =========

let g:instant_markdown_autostart = 0

let g:UltiSnipsSnippetDirectories=[
    \'UltiSnips',
    \$HOME.'/dotfiles/UltiSnips/general',
    \$HOME.'/dotfiles/UltiSnips/specific'
\]

" ale
let g:ale_php_phpcs_standard = 'PSR2'
let g:ale_linters = {
    \ 'javascript': ['eslint'],
    \ 'php': ['phpcs', 'php', 'phpstan']
    \}
let g:ale_fixers = {
	\   '*': ['remove_trailing_lines', 'trim_whitespace'],
    \   'javascript': ['prettier', 'eslint'],
    \   'php': ['phpcbf', 'php_cs_fixer'],
    \}
let g:ale_completion_enabled = 1
let g:ale_fix_on_save = 1

if executable("rg")
    set grepprg=rg\ --color=never
    let g:grep_cmd_opts = '--line-number --no-heading'
endif

" CtrlP
let g:ctrlp_show_hidden = 1
let g:ctrlp_use_caching = 0

if executable('rg')
    let g:ctrlp_user_command = 'ag %s -l -g ""'
    let g:ctrlp_use_caching = 0
elseif executable('ag')
    let g:ctrlp_user_command = 'rg %s --files --color=never --glob ""'
    let g:ctrlp_use_caching = 0
else
    set wildignore+=*/vendor/**
    set wildignore+=*/app/cache/**
    set wildignore+=*/app/logs/**
    set wildignore+=*/var/cache/**
    set wildignore+=*/var/logs/**
    set wildignore+=*/node_modules/**
endif

" UltiSnips {
let g:UltiSnipsExpandTrigger       = '<tab>'
let g:UltiSnipsJumpForwardTrigger  = '<tab>'
let g:UltiSnipsJumpBackwardTrigger = '<s-tab>'
let g:UltiSnipsEditSplit           = 'vertical'

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
hi GitGutterAdd ctermfg=2 ctermbg=bg guifg=#009900 guibg=bg
hi GitGutterChange ctermfg=3 ctermbg=bg guifg=#bbbb00 guibg=bg
hi GitGutterDelete ctermfg=1 ctermbg=bg guifg=#ff2222 guibg=bg
hi! link Pmenu VisualNOS
" }

let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:deplete#auto_complete_delay = 0


  " Open terminal in vertical, horizontal and new tab
nnoremap <leader>tv :vsplit<cr>:term<CR>
nnoremap <leader>ts :split<cr>:term<CR>
nnoremap <leader>tt :tabnew<cr>:term<CR>

tnoremap <leader>tv <C-w>:vsplit<cr>:term<CR>
tnoremap <leader>ts <C-w>:split<cr>:term<CR>
tnoremap <leader>tt <C-w>:tabnew<cr>:term<CR>

" Open file under cursor in a new vertical/horizontal split +10 speed pts;
noremap gv <C-W>vgf
noremap gs <C-W>sgf
