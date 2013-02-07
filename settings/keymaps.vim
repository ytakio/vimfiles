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
" For Tagbar
" Open and close Tagbar
nnoremap <silent> <Leader>t :TagbarOpenAutoClose<CR>

"-------------------------------------------------------
" For NERDTree
nnoremap <silent> <C-N> :NERDTreeToggle<CR>

