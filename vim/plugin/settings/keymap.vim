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
" Fugitive: {{{
nnoremap <Leader>gb :Gblame<CR>
nnoremap <Leader>gc :Gcommit -v<CR>
nnoremap <Leader>gac :Gcommit --amend -v<CR>
nnoremap <Leader>gd :Gdiffsplit!<CR>
nnoremap <Leader>gp :Gpush<CR>
nnoremap <Leader>gr :Gread<CR>
nnoremap <Leader>gs :Gstatus<CR>
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

" Plugin Mappings: {{{
nmap <C-]> <Plug>(coc-definition)
nmap <leader>ci <Plug>(coc-references)
nmap <leader>cr <Plug>(coc-rename)
nmap <leader>cl  :call CocAction('format')<CR>
" Use K to show documentation in preview window.
nnoremap <silent> K :call <SID>show_documentation()<CR>
function! s:show_documentation()
  if (index(['vim','help'], &filetype) >= 0)
    execute 'h '.expand('<cword>')
  elseif (coc#rpc#ready())
    call CocActionAsync('doHover')
  else
    execute '!' . &keywordprg . " " . expand('<cword>')
  endif
endfunction

nnoremap <leader>tb :TagbarToggle<CR>

nnoremap <Leader>nt :NERDTreeToggle<CR>
nnoremap <Leader>nf :NERDTreeFind<CR>
nnoremap <Leader>f :Telescope find_files<CR>
nnoremap <Leader>p :Telescope git_files<CR>
nnoremap <Leader>gS :Telescope git_status<CR>
nnoremap <Leader>b :Telescope buffers<CR>
nnoremap <Leader>l :Telescope treesitter<CR>
nnoremap <Leader>gf :Telescope live_grep<CR>
nnoremap <Leader>F :CocSearch <C-R>=expand("<cword>")<CR><CR>
" }}}
