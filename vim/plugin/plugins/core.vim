Plug 'SirVer/ultisnips'
Plug 'honza/vim-snippets'
Plug 'glepnir/galaxyline.nvim' , {'branch': 'main'}
Plug 'jiangmiao/auto-pairs'
Plug 'phpactor/phpactor',             { 'for': 'php', 'tag': '*', 'do': 'composer install --no-dev -o'}
Plug 'skwp/greplace.vim'
Plug 'sniphpets/sniphpets',           { 'for': 'php' }
Plug 'sniphpets/sniphpets-common',    { 'for': 'php' }
Plug 'sniphpets/sniphpets-doctrine',  { 'for': 'php' }
Plug 'sniphpets/sniphpets-phpunit',   { 'for': 'php' }
Plug 'sniphpets/sniphpets-symfony',   { 'for': 'php' }
Plug 'iamcco/markdown-preview.nvim',  { 'for': ['markdown','md'], 'do': 'cd app && yarn install' }
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
Plug 'kyazdani42/nvim-web-devicons'
Plug 'rhysd/committia.vim'
Plug 'norcalli/nvim-colorizer.lua'
Plug 'ThePrimeagen/harpoon'

" telescope
Plug 'nvim-lua/popup.nvim'
Plug 'nvim-lua/plenary.nvim'
Plug 'nvim-telescope/telescope.nvim'
Plug 'nvim-telescope/telescope-fzf-native.nvim', { 'do': 'make' }

Plug 'lewis6991/gitsigns.nvim'

" LSP
Plug 'neovim/nvim-lspconfig'
Plug 'onsails/lspkind-nvim'
Plug 'kyazdani42/nvim-tree.lua'

" Completion things
Plug 'hrsh7th/nvim-cmp'
Plug 'hrsh7th/cmp-nvim-lsp'
Plug 'hrsh7th/cmp-buffer'
Plug 'hrsh7th/cmp-path'
Plug 'quangnguyen30192/cmp-nvim-ultisnips', { 'commit': '78a9452d61bc7f1c3aeb33f6011513760f705bdf'}
