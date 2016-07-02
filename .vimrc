syntax on
set number
set cursorline
set backspace=2
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:¬
set guioptions-=L
set nohlsearch

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

filetype plugin indent on
" show existing tab with 4 spaces width
set tabstop=4
" " when indenting with '>', use 4 spaces width
set shiftwidth=4
" " On pressing tab, insert 4 spaces
set expandtab


 " Vundle config
set nocompatible              " be iMproved, required
filetype off                  " required
set rtp+=~/.vim/bundle/Vundle.vim
call vundle#begin()
Plugin 'VundleVim/Vundle.vim'
" PLUGINS
Plugin 'tpope/vim-fugitive'
" The sparkup vim script is in a subdirectory of this repo called vim.
" Pass the path to set the runtimepath properly.
Plugin 'rstacruz/sparkup', {'rtp': 'vim/'}
" numbers
Bundle "myusuf3/numbers.vim"
" nerdtree
Bundle 'scrooloose/nerdtree'
"GITGUTTER
Plugin 'airblade/vim-gitgutter'
"ctrl p
Bundle 'kien/ctrlp.vim'
" Vim powerline
Plugin 'vim-airline/vim-airline' 
Plugin 'vim-airline/vim-airline-themes'
let g:airline_powerline_fonts=1
  " powerline symbols

Plugin 'evidens/vim-twig'
Plugin 'mattn/emmet-vim'

" colorschemes
Plugin 'tomasr/molokai'
" Track the engine.
Plugin 'SirVer/ultisnips'
"
" " Snippets are separated from the engine. Add this if you want them:
Plugin 'honza/vim-snippets'
"
Plugin 'tomtom/tcomment_vim'
" Plugin 'qbbr/vim-symfony'
" Plugin 'docteurklein/vim-symfony'

"" JavaScript --------------
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'
Plugin 'kchmck/vim-coffee-script'



let g:UltiSnipsExpandTrigger="<tab>"
"let g:UltiSnipsJumpForwardTrigger="<c-b>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<c-z>"
" " If you want :UltiSnipsEdit to split your window.
let g:UltiSnipsEditSplit="vertical"

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

" Brief help
" :PluginList       - lists configured plugins
" :PluginInstall    - installs plugins; append `!` to update or just :PluginUpdate
" :PluginSearch foo - searches for foo; append `!` to refresh local cache
" :PluginClean      - confirms removal of unused plugins; append `!` to auto-approve removal

" see :h vundle for more details or wiki for FAQ
" Put your non-Plugin stuff after this line

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
let NERDTreeDirArrows=0
let g:rehash256 = 1
colorscheme molokai

let mapleader = ','
nnoremap <Leader>nt :NERDTreeToggle<CR>           " Open NERDTree
nnoremap <Leader>p :CtrlP<CR>           " User CtrlP
