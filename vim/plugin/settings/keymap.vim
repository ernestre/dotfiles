" General: {{{
vmap <C-C> "+y
vmap <C-X> "+x

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv
nnoremap J mzJ`z

inoremap , ,<c-g>u
inoremap . .<c-g>u

nnoremap <space> :set hlsearch! hlsearch?<CR> " Toggle hlsearch

nnoremap <C-s> <C-^>

" Paste in visual mode without copying
xnoremap p pgvy

nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>

" Avoid typos
command! WQ wq
command! Wq wq
command! W w
command! Wa wa
command! Wqa wqa
command! Q q

" Reselect visual block after indent/outdent
vnoremap < <gv
vnoremap > >gv

" Resize panes
nnoremap <C-l> :vertical resize -5<cr>
" nnoremap <C-j> :resize +5<cr>
" nnoremap <C-k> :resize -5<cr>
nnoremap <C-h> :vertical resize +5<cr>

nnoremap <leader>so :SymbolsOutline<CR>
nmap <leader>vm <Plug>MarkdownPreviewToggle
" }}}
" Fugitive: {{{
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gB <Cmd>lua require"gitsigns".blame_line{full=true}<CR>
nnoremap <Leader>gc :Git commit -v \| MaximizerToggle<CR>
nnoremap <Leader>gac :Git commit --amend -v \| MaximizerToggle<CR>
nnoremap <Leader>gd :Gdiffsplit!<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gh :diffget //2<CR>
nnoremap <Leader>gl :diffget //3<CR>
" }}}
" Gitsigns: {{{
nnoremap gn :Gitsigns next_hunk<cr>
nnoremap gp :Gitsigns prev_hunk<cr>
nnoremap gu :Gitsigns reset_hunk<cr>
" }}}
" LSP: {{{
nmap <C-]> <Cmd>lua vim.lsp.buf.definition()<CR>
nmap <leader>ci <Cmd>lua vim.lsp.buf.references()<CR>
nmap <leader>r <Cmd>lua vim.lsp.buf.rename()<CR>
nmap <leader>cl <Cmd>lua vim.lsp.buf.formatting()<CR><CR>
nnoremap <silent>K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <S-l> <Cmd>lua vim.diagnostic.goto_next()<CR>
nnoremap <S-h> <Cmd>lua vim.diagnostic.goto_prev()<CR>
nnoremap <S-c> <Cmd>lua vim.diagnostic.setloclist()<CR>
" }}}
" NvimTree: {{{
nnoremap <Leader>nt :NvimTreeToggle<CR>
nnoremap <Leader>nf :NvimTreeFindFile<CR>
" }}}
" Telescope: {{{
nnoremap <Leader>f :Telescope find_files<CR>
nnoremap <Leader>F :Telescope find_files find_command=rg,--no-ignore,--hidden,--files,.<CR>
nnoremap <Leader>p :Telescope git_files<CR>
nnoremap <Leader>gS :Telescope git_status<CR>
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <Leader>l :Telescope treesitter<CR>
nnoremap <Leader>gf :Telescope live_grep<CR>
" }}}
" ThePrimeagen/harpoon: {{{
nnoremap <leader>t <Cmd>lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>1 <Cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 <Cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>ha <Cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hq <Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
" }}}
" phaazon/hop.nvim: {{{
nnoremap <leader>hw :HopWord<CR>
nnoremap <leader>hl :HopLine<CR>
" }}}
" nvim-dap: {{{
nnoremap <leader>db <Cmd>lua require'dap'.toggle_breakpoint()<CR>
nnoremap <leader>dt <Cmd>lua require'dap-go'.debug_test()<CR>
nnoremap <leader>dc <Cmd>lua require'dap'.continue()<CR>
nnoremap <leader>dl <Cmd>lua require'dap'.step_over()<CR>
nnoremap <leader>dj <Cmd>lua require'dap'.step_into()<CR>
nnoremap <leader>dk <Cmd>lua require'dap'.step_out()<CR>
nnoremap <leader>ds <Cmd>lua require'dap'.close()<CR>
" }}}
" vim-test: {{{
nmap <silent> <leader><leader>t :TestNearest<CR>
" }}}
