function! PostCocInstall(info)
    if a:info.status == 'installed' || a:info.force
        exec ":CocInstall coc-emmet coc-snippets coc-yaml coc-json coc-vim coc-tsserver coc-spell-checker"
    endif
endfunction

Plug 'SirVer/ultisnips'
Plug 'easymotion/vim-easymotion'
Plug 'ervandew/supertab'
Plug 'honza/vim-snippets'
Plug 'itchyny/lightline.vim'
Plug 'jiangmiao/auto-pairs'
Plug 'neoclide/coc.nvim',             { 'branch': 'release', 'do': function('PostCocInstall')}
Plug 'phpactor/phpactor',             { 'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'skwp/greplace.vim'
Plug 'sniphpets/sniphpets',           { 'for': 'php' }
Plug 'sniphpets/sniphpets-common',    { 'for': 'php' }
Plug 'sniphpets/sniphpets-doctrine',  { 'for': 'php' }
Plug 'sniphpets/sniphpets-phpunit',   { 'for': 'php' }
Plug 'sniphpets/sniphpets-symfony',   { 'for': 'php' }
Plug 'iamcco/markdown-preview.nvim',  { 'for': ['markdown','md'], 'do': 'cd app && yarn install' }
Plug 'tpope/vim-commentary'
Plug 'tpope/vim-repeat'
Plug 'tpope/vim-surround'
Plug 'vimwiki/vimwiki'
Plug 'unblevable/quick-scope'
Plug 'sainnhe/sonokai'
Plug 'kyazdani42/nvim-web-devicons'
Plug 'kyazdani42/nvim-tree.lua', { 'commit': '18fffc09bfc27d6665644aeff1cf53bf87591cc0' }
Plug 'nvim-treesitter/nvim-treesitter'
Plug 'szw/vim-maximizer'
Plug 'puremourning/vimspector'

" Git
Plug 'lewis6991/gitsigns.nvim'
Plug 'rhysd/committia.vim'
Plug 'tpope/vim-fugitive'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }
Plug 'nvim-lua/plenary.nvim'

" Plug 'dstein64/vim-startuptime'
