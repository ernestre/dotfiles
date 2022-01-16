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
" }}}
" Edit or source .vimrc: {{{
nnoremap <leader>ev :e ~/.vimrc<cr>
nnoremap <leader>sv :source ~/.vimrc<cr>
" }}}
" Avoid typos: {{{
command! WQ wq
command! Wq wq
command! W w
command! Wa wa
command! Wqa wqa
command! Q q
" }}}
" Reselect visual block after indent/outdent: {{{
vnoremap < <gv
vnoremap > >gv
" }}}
" Paste in visual mode without copying {{{
xnoremap p pgvy
" }}}
" Fugitive: {{{
nnoremap <Leader>gb :Git blame<CR>
nnoremap <Leader>gB <Cmd>lua require"gitsigns".blame_line{full=true}<CR>
nnoremap <Leader>gc :Git commit  -v<CR>
nnoremap <Leader>gac :Git commit --amend -v<CR>
nnoremap <Leader>gd :Gdiffsplit!<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Git<CR>
nnoremap <Leader>gw :Gwrite<CR>
nnoremap <Leader>gh :diffget //2<CR>
nnoremap <Leader>gl :diffget //3<CR>
" }}}
" Resize panes: {{{
nnoremap <C-l> :vertical resize -5<cr>
" nnoremap <C-j> :resize +5<cr>
" nnoremap <C-k> :resize -5<cr>
nnoremap <C-h> :vertical resize +5<cr>
" }}}
" Quick git hunk switching: {{{
nnoremap gn :Gitsigns next_hunk<cr>
nnoremap gp :Gitsigns prev_hunk<cr>
nnoremap gu :Gitsigns reset_hunk<cr>
" }}}
nnoremap <C-s> <C-^>

nmap <leader>vm <Plug>MarkdownPreviewToggle

nmap <C-]> <Cmd>lua vim.lsp.buf.definition()<CR>
nmap <leader>ci <Cmd>lua vim.lsp.buf.references()<CR>
nmap <leader>r <Cmd>lua vim.lsp.buf.rename()<CR>
nmap <leader>cl <Cmd>lua vim.lsp.buf.formatting()<CR><CR>
nnoremap <silent>K <Cmd>lua vim.lsp.buf.hover()<CR>
nnoremap <S-l> <Cmd>lua vim.lsp.diagnostic.goto_next()<CR>
nnoremap <S-h> <Cmd>lua vim.lsp.diagnostic.goto_prev()<CR>
nnoremap <S-c> <Cmd>lua vim.lsp.diagnostic.set_loclist()<CR>

nnoremap <Leader>nt :NvimTreeToggle<CR>
nnoremap <Leader>nf :NvimTreeFindFile<CR>
nnoremap <Leader>f :Telescope find_files<CR>
nnoremap <Leader>F :Telescope find_files find_command=rg,--no-ignore,--hidden,--files,.<CR>
nnoremap <Leader>p :Telescope git_files<CR>
nnoremap <Leader>gS :Telescope git_status<CR>
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <Leader>l :Telescope treesitter<CR>
nnoremap <Leader>gf :Telescope live_grep<CR>

" puremourning/vimspector: {{{
nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>
nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>
nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
" }}}

" ThePrimeagen/harpoon: {{{
nnoremap <leader>t <Cmd>lua require("harpoon.term").gotoTerminal(1)<CR>
nnoremap <leader>1 <Cmd>lua require("harpoon.ui").nav_file(1)<CR>
nnoremap <leader>2 <Cmd>lua require("harpoon.ui").nav_file(2)<CR>
nnoremap <leader>ha <Cmd>lua require("harpoon.mark").add_file()<CR>
nnoremap <leader>hq <Cmd>lua require("harpoon.ui").toggle_quick_menu()<CR>
" }}}

nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
