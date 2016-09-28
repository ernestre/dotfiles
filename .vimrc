syntax on
set number
set cursorline
set backspace=2
set list
set listchars=tab:›\ ,trail:•,extends:#,nbsp:.,eol:¬
set guioptions-=L
set guioptions-=r
set guifont=Roboto\ Mono\ Light\ for\ Powerline:h11
set colorcolumn=121
set complete-=i

" Remove white space on save.
autocmd BufWritePre * %s/\s\+$//e

" disable error bell {
set noerrorbells visualbell t_vb=
autocmd GUIEnter * set visualbell t_vb=
" }

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

Plugin 'tpope/vim-surround'

Plugin 'evidens/vim-twig'
Plugin 'mattn/emmet-vim'

" colorschemes
Plugin 'hpoydar/vim-colors-ir-dark-gray'
Plugin 'godlygeek/csapprox'

Plugin 'tomtom/tcomment_vim'
Bundle 'arnaud-lb/vim-php-namespace'

" autocomplete {
Plugin 'Valloric/YouCompleteMe'
let g:ycm_key_list_select_completion   = ['<C-j>', '<C-n>', '<Down>']
let g:ycm_key_list_previous_completion = ['<C-k>', '<C-p>', '<Up>']

let g:EclimCompletionMethod = 'omnifunc'
" }

" superTab {
Plugin 'ervandew/supertab'
let g:SuperTabDefaultCompletionType    = '<C-n>'
let g:SupereTabCrMapping                = 0
" }

" UltiSnips {
Plugin 'honza/vim-snippets'
Plugin 'SirVer/ultisnips'
let g:UltiSnipsExpandTrigger="<tab>"
let g:UltiSnipsJumpForwardTrigger="<tab>"
let g:UltiSnipsJumpBackwardTrigger="<s-tab>"
let g:UltiSnipsEditSplit="vertical"
"
Plugin 'sniphpets/sniphpets'
Plugin 'sniphpets/sniphpets-symfony'
Plugin 'sniphpets/sniphpets-doctrine'
Plugin 'sniphpets/sniphpets-phpunit'
" }

" tags {

    " AutoTag {
        Plugin 'craigemery/vim-autotag'
        let g:autotagTagsFile="tags"
    " }

    Plugin 'majutsushi/tagbar'
    set tags+=tags.vendors
" }

Plugin 'easymotion/vim-easymotion'

" Plugin 'qbbr/vim-symfony'
" Plugin 'docteurklein/vim-symfony'

"" JavaScript --------------
Plugin 'pangloss/vim-javascript'
Plugin 'mxw/vim-jsx'

" All of your Plugins must be added before the following line
call vundle#end()            " required
filetype plugin indent on    " required

set rtp+=$HOME/.local/lib/python2.7/site-packages/powerline/bindings/vim/

" Always show statusline
set laststatus=2
"
" " Use 256 colours (Use this setting only if your terminal supports 256
" colours)
set t_Co=256
let NERDTreeDirArrows=0
let g:rehash256 = 1

if filereadable(glob('~/.vim/bundle/vim-colors-ir-dark-gray/colors/ir_dark_gray.vim'))
    colorscheme ir_dark_gray
endif

let mapleader = ','
nnoremap <Leader>nt :NERDTreeToggle<CR>           " Open NERDTree
nnoremap <Leader>p :CtrlP<CR>           " User CtrlP

function! IPhpInsertUse()
    call PhpInsertUse()
    call feedkeys('a',  'n')
endfunction
autocmd FileType php inoremap <Leader>u <Esc>:call IPhpInsertUse()<CR>
autocmd FileType php noremap <Leader>u :call PhpInsertUse()<CR>

function! IPhpExpandClass()
    call PhpExpandClass()
    call feedkeys('a', 'n')
endfunction
autocmd FileType php inoremap <Leader>e <Esc>:call IPhpExpandClass()<CR>
autocmd FileType php noremap <Leader>e :call PhpExpandClass()<CR>
