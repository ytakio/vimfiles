"-------------------------------------------------------
" カーソルを表示行で移動
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk
nnoremap @ <Esc>
nnoremap <C-@> @
nnoremap <C-@><C-@> @@

"-------------------------------------------------------
" For replace command
nnoremap s/ :%s//gc<left><left><left>

"-------------------------------------------------------
" For Unite
" Open MRU
nnoremap				[Unite]		<Nop>
nmap					<Leader>u	[Unite]
nnoremap	<silent> 	[Unite]r	:Unite file_mru<CR>

"-------------------------------------------------------
" For Tagbar
" Open and close Tagbar
nnoremap <silent> <Leader>t :TagbarOpenAutoClose<CR>

"-------------------------------------------------------
" For NERDTree
nnoremap <silent> <C-N> :execute 'NERDTree ' . getcwd()<CR>

