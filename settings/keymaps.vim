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
" For taglist.vim
" Open and close TagList
nnoremap <silent> <F8> :TlistToggle<CR>

"-------------------------------------------------------
" For NERDTree
nnoremap <silent> <C-N> :NERDTreeToggle<CR>

