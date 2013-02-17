"-------------------------------------------------------
" カーソルを表示行で移動
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

"-------------------------------------------------------
" For replace command
nnoremap s/ :%s//gc<left><left><left>

"-------------------------------------------------------
" For Unite
" Open MRU
nnoremap				[Unite]		<Nop>
nmap					<Leader>u	[Unite]
nnoremap	<silent> 	[Unite]f	:UniteWithBufferDir -buffer-name=files file<CR>
nnoremap	<silent> 	[Unite]r	:Unite -buffer-name=files file_mru<CR>
nnoremap	<silent> 	[Unite]y	:Unite -buffer-name=register register<CR>

"-------------------------------------------------------
" For Tagbar
" Open and close Tagbar
nnoremap <silent> <Leader>t :TagbarOpenAutoClose<CR>

"-------------------------------------------------------
" For NERDTree
nnoremap <silent> <C-N> :execute 'NERDTree ' . getcwd()<CR>

