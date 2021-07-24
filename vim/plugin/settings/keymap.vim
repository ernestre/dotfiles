" General: {{{
vmap <C-C> "+y
vmap <C-X> "+x

" Search mappings: These will make it so that going to the next one in a
" search will center on the line it's found in.
nnoremap n nzzzv
nnoremap N Nzzzv

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
nnoremap <Leader>gb :Gblame<CR>
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
nnoremap <C-j> :resize +5<cr>
nnoremap <C-k> :resize -5<cr>
nnoremap <C-h> :vertical resize +5<cr>
" }}}
" Quick buffer switching: {{{
nnoremap gn :bn<cr>
nnoremap gp :bp<cr>
nnoremap gd :bd<cr>
" }}}
" Open terminal in vertical, horizontal and new tab: {{{
nnoremap <leader>tv :vsplit<cr>:term<CR>
nnoremap <leader>ts :split<cr>:term<CR>
nnoremap <leader>tt :tabnew<cr>:term<CR>
" }}}
" Open file under cursor in a new vertical/horizontal split +10 speed pts: {{{
nnoremap gv <C-W>vgf
nnoremap gs <C-W>sgf
" }}}
nnoremap <C-s> <C-^>

nmap <leader>vm <Plug>MarkdownPreviewToggle

" Plugin Mappings: {{{
" nmap <C-]> <Plug>(coc-definition)
nmap <C-]> <Cmd>lua vim.lsp.buf.definition()<CR>
" nmap <leader>ci <Plug>(coc-references)
nmap <leader>ci <Cmd>lua vim.lsp.buf.references()<CR>
" nmap <leader>cr <Plug>(coc-rename)
nmap <leader>cr <Cmd>lua vim.lsp.buf.rename()<CR>
" nmap <leader>cl :call CocAction('format')<CR>
nmap <leader>cl <Cmd>lua vim.lsp.buf.formatting()<CR><CR>
" nnoremap <silent>K :call <SID>show_documentation()<CR>
nnoremap <silent>K <Cmd>lua vim.lsp.buf.hover()<CR>
" function! s:show_documentation()
"   if (index(['vim','help'], &filetype) >= 0)
"     execute 'h '.expand('<cword>')
"   elseif (coc#rpc#ready())
"     call CocActionAsync('doHover')
"   else
"     execute '!' . &keywordprg . " " . expand('<cword>')
"   endif
" endfunction

nnoremap <leader>tb :TagbarToggle<CR>

nnoremap <Leader>nt :NvimTreeToggle<CR>
nnoremap <Leader>nf :NvimTreeFindFile<CR>
nnoremap <Leader>nr :NvimTreeRefresh<CR>
nnoremap <Leader>f :Telescope find_files<CR>
nnoremap <Leader>F :Telescope find_files find_command=rg,--no-ignore,--hidden,--files,.<CR>
nnoremap <Leader>p :Telescope git_files<CR>
nnoremap <Leader>gS :Telescope git_status<CR>
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <Leader>l :Telescope treesitter<CR>
nnoremap <Leader>gf :Telescope live_grep<CR>
" }}}

" szw/vim-maximizer: {{{
nnoremap <silent>m :MaximizerToggle!<CR>
" }}}

" puremourning/vimspector: {{{
nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>
nnoremap <leader>dd :call vimspector#Launch()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
" }}}

" puremourning/vimspector: {{{
nnoremap <leader>dd :call vimspector#Launch()<CR>
nnoremap <leader>de :call vimspector#Reset()<CR>
nnoremap <leader>dtcb :call vimspector#CleanLineBreakpoint()<CR>

nmap <leader>dl <Plug>VimspectorStepInto
nmap <leader>dj <Plug>VimspectorStepOver
nmap <leader>dk <Plug>VimspectorStepOut
nmap <leader>d_ <Plug>VimspectorRestart
nnoremap <leader>d<space> :call vimspector#Continue()<CR>

nmap <leader>drc <Plug>VimspectorRunToCursor
nmap <leader>dbp <Plug>VimspectorToggleBreakpoint
nmap <leader>dcbp <Plug>VimspectorToggleConditionalBreakpoint
