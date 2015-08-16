" Don't use Ex mode, use Q for formatting
map Q gq
" CTRL-U in insert mode deletes a lot.  Use CTRL-G u to first break undo,
" so that you can undo CTRL-U after inserting a line break.
inoremap <C-U> <C-G>u<C-U>
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

