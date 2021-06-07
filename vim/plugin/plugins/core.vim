function! PostCocInstall(info)
    if a:info.status == 'installed' || a:info.force
        exec ":CocInstall coc-emmet coc-snippets coc-yaml coc-json coc-vim coc-tsserver coc-spell-checker"
    endif
endfunction

Plug 'SirVer/ultisnips', { 'tag': '3.2' }
Plug 'Xuyuanp/nerdtree-git-plugin'
Plug 'airblade/vim-gitgutter'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim',             { 'branch': 'release', 'do': function('PostCocInstall')}
Plug 'phpactor/phpactor',             { 'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'scrooloose/nerdtree'
Plug 'skwp/greplace.vim'
Plug 'sniphpets/sniphpets',           { 'for': 'php' }
Plug 'sniphpets/sniphpets-common',    { 'for': 'php' }
Plug 'sniphpets/sniphpets-doctrine',  { 'for': 'php' }
Plug 'sniphpets/sniphpets-phpunit',   { 'for': 'php' }
Plug 'sniphpets/sniphpets-symfony',   { 'for': 'php' }
Plug 'suan/vim-instant-markdown',     { 'for': ['markdown','md'] }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-fugitive'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'unblevable/quick-scope'
Plug 'sainnhe/sonokai'
Plug 'ryanoasis/vim-devicons'
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'szw/vim-maximizer'
Plug 'puremourning/vimspector'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

" Write function for telescope specific directories
