function! PostCocInstall(info)
    exec ":CocInstall coc-emmet coc-snippets coc-yaml coc-json coc-tsserver"
endfunction

Plug 'SirVer/ultisnips'
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'fatih/vim-go', { 'do': ':GoUpdateBinaries' }
Plug 'godlygeek/tabular'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'junegunn/fzf',                  { 'dir': '~/.fzf', 'do': './install --all'  }
Plug 'junegunn/fzf.vim'
Plug 'majutsushi/tagbar'
Plug 'neoclide/coc.nvim',             { 'branch': 'release', 'do': function('PostCocInstall')}
Plug 'phpactor/phpactor',             { 'do': 'composer install', 'for': 'php'}
Plug 'scrooloose/nerdtree'
Plug 'skwp/greplace.vim'
Plug 'sniphpets/sniphpets',           { 'for': 'php' }
Plug 'sniphpets/sniphpets-common',    { 'for': 'php' }
Plug 'sniphpets/sniphpets-doctrine',  { 'for': 'php' }
Plug 'sniphpets/sniphpets-phpunit',   { 'for': 'php' }
Plug 'sniphpets/sniphpets-symfony',   { 'for': 'php' }
Plug 'suan/vim-instant-markdown',     { 'for': ['markdown','md'] }
Plug 'tomtom/tcomment_vim'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'unblevable/quick-scope'
Plug 'sainnhe/sonokai'
Plug 'sheerun/vim-polyglot'
