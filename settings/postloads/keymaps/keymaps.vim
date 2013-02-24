"-------------------------------------------------------
" カーソルを表示行で移動
nnoremap j gj
nnoremap k gk
nnoremap <Down> gj
nnoremap <Up> gk

"-------------------------------------------------------
" For replace command
nnoremap <expr> s/ ':%s/' . expand('<cword>') . '//gc<left><left><left>'
nnoremap <expr> S/ ':%s/\<' . expand('<cword>') . '\>//gc<left><left><left>'
vnoremap s/ :s//gc<left><left><left>

