NeoBundle 'gtags.vim'
let g:Gtags_Result = "ctags"
nmap <F2> :copen<CR>
nmap <F4> :cclose<CR>
nmap <F5> :Gtags<SPACE>
nmap <F6> :Gtags -f %<CR>
nmap <F7> :GtagsCursor<CR>
nmap <F8> :Gozilla<CR>
nmap <C-\><C-]> :GtagsCursor<CR>
