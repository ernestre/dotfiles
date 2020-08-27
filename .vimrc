call plug#begin('~/.vim/plugged')

function! PostCocInstall(info)
    exec ":CocInstall coc-emmet coc-snippets coc-yaml coc-json coc-tsserver"
    exec "!go get -u github.com/sourcegraph/go-langserver"
    exec "!npm i -g intelephense"
endfunction

Plug 'neoclide/coc.nvim', {'branch': 'release', 'do': function('PostCocInstall')}

nmap <C-]> <Plug>(coc-definition)
nmap <silent>gi <Plug>(coc-references)
nmap <silent>gr <Plug>(coc-rename)
nmap <silent>gl  :call CocAction('format')<CR>

Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go',                  { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf',                  { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'junegunn/goyo.vim'
Plug 'majutsushi/tagbar'
Plug 'phpactor/phpactor',             { 'do': 'composer install', 'for': 'php'}
Plug 'rking/ag.vim'
Plug 'scrooloose/nerdtree'
Plug 'skwp/greplace.vim'
Plug 'sniphpets/sniphpets',           { 'for': 'php' }
Plug 'sniphpets/sniphpets-common',    { 'for': 'php' }
Plug 'sniphpets/sniphpets-doctrine',  { 'for': 'php' }
Plug 'sniphpets/sniphpets-phpunit',   { 'for': 'php' }
Plug 'sniphpets/sniphpets-symfony',   { 'for': 'php' }
Plug 'suan/vim-instant-markdown',     { 'for': ['markdown','md'] }
Plug 'tomasr/molokai'
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'

call plug#end()
let g:vim_markdown_no_extensions_in_markdown = 1

let mapleader = ','

let NERDTreeDirArrows=0
let g:rehash256 = 1
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:¬
set nowrap
set backspace=2
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
set diffopt+=vertical

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
nnoremap <Leader>f :Files<CR>
nnoremap <Leader>p :GFiles<CR>
nnoremap <Leader>gS :GFiles?<CR>
nnoremap <Leader>P :CtrlPBufTag<CR>
nnoremap <Leader>b :Buffers<CR>

" Fugitive
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gac :Gcommit --amend -v<CR>
nnoremap <Leader>gd :Gdiffsplit!<CR>
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

nnoremap <leader>t :TagbarToggle<CR>

" Settings

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

" Styling (use :hi for color reference): {
set linespace=2
hi    LineNr            guibg=bg        ctermbg=bg
hi    SignColumn        guibg=bg        ctermbg=bg
hi    foldcolumn        guibg=bg        ctermbg=bg
hi    VertSplit         guibg=bg        guifg=bg        ctermbg=bg      ctermfg=bg
hi    TabLine           cterm=bold      ctermfg=8       ctermbg=bg
hi    TabLineFill       cterm=bold      ctermbg=bg
hi    GitGutterAdd      ctermfg=2       ctermbg=bg      guifg=#009900   guibg=bg
hi    GitGutterChange   ctermfg=3       ctermbg=bg      guifg=#bbbb00   guibg=bg
hi    GitGutterDelete   ctermfg=1       ctermbg=bg      guifg=#ff2222   guibg=bg
hi!   link              Pmenu           VisualNOS
hi    DiffText          gui=none,bold   guibg=#4C4745
hi    Macro             gui=none        guifg=#C4BE89
hi    SpecialKey        gui=none        guifg=#66D9EF
hi    Special           gui=none        guifg=#66D9EF   guibg=bg
hi    StorageClass      gui=none        guifg=#FD971F
hi    Tag               gui=none        guifg=#F92672
" }

let g:gitgutter_sign_removed = '-'
let g:gitgutter_sign_removed_first_line = '-'

let g:SuperTabDefaultCompletionType = "<c-n>"
let g:deplete#auto_complete_delay = 0


" Open terminal in vertical, horizontal and new tab
nnoremap <leader>tv :vsplit<cr>:term<CR>
nnoremap <leader>ts :split<cr>:term<CR>
nnoremap <leader>tt :tabnew<cr>:term<CR>

" Open file under cursor in a new vertical/horizontal split +10 speed pts;
noremap gv <C-W>vgf
noremap gs <C-W>sgf

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
