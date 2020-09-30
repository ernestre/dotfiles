let mapleader = ','
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:¬
set nowrap
set backspace=2
set complete-=i
set encoding=utf-8
set expandtab            " On pressing tab, insert 4 spaces
set exrc                 " allow project specific .vimrc configurations {{
set guioptions-=L        " remove left-hand scroll bar
set guioptions-=T        " remove toolbar
set guioptions-=m        " remove menu bar
set guioptions-=r        " remove right-hand scroll bar
set hidden               " Allow buffer switching without saving
set laststatus=2         " Always show statusline
set lazyredraw           " will buffer screen updates instead of updating all the time
set list
set maxmempattern=20000  " increase max memory to show syntax highlighting for large files
set nobackup             " Don't create backup files
set nocompatible         " be iMproved, required
set nocursorcolumn
set noshowcmd
set noshowmode           " We show the mode with airline or lightline
set noswapfile           " Don't create swapfile
set number               " show line numbers
set relativenumber
set path+=**             " Look for files recursively
set pumheight=10         " Completion window max size
set scrolloff=10         " scroll off padding
set shiftwidth=4         " when indenting with '>', use 4 spaces width
set noerrorbells
set splitright           " Open new splits on the right
set synmaxcol=200        " syntax highlight only 200 chars"
set t_Co=256             " Use 256 colours (Use this setting only if your terminal supports 256
set tabstop=4            " show existing tab with 4 spaces width
set ttyfast
set updatetime=1000      " wait ms after stop typing to trigger scripts
set cursorline
set diffopt+=vertical
set linespace=2
set shortmess=I          " Disable welcome message
set fillchars+=vert:\    " Remove vertical line split
let &colorcolumn="80,".join(range(120,999),",")

let $KEYMAPS='~/.vim/plugin/settings/keymap.vim'
let $PLUGINLIST='~/.vim/plugin/plugins/core.vim'

autocmd BufWritePre * %s/\s\+$//e " Remove white space on save.

if (has("nvim"))
    set inccommand=nosplit
    tnoremap <Esc> <C-\><C-n>
endif

syntax on
syntax sync minlines=256  " start highlighting from 256 lines backwards
filetype plugin indent on

call plug#begin('~/.vim/plugged')
    for fpath in split(globpath('~/.vim/plugin/plugins', '*.vim'), '\n')
      exe 'source' fpath
    endfor
call plug#end()

" Fix true issue for vim: https://github.com/tmux/tmux/issues/1246
if exists('+termguicolors') && !has('macunix')
  let &t_8f = "\<Esc>[38;2;%lu;%lu;%lum"
  let &t_8b = "\<Esc>[48;2;%lu;%lu;%lum"
  set termguicolors
endif

if has("nvim")
  au TermOpen * tnoremap <Esc> <c-\><c-n>
  au FileType fzf tunmap <Esc>
endif
