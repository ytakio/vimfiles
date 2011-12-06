" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)

"---------------------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
if has('unix') && !has('gui_running')
  let uname = system('uname')
  if uname =~? "linux"
    set term=builtin_linux
  elseif uname =~? "freebsd"
    set term=builtin_cons25
  elseif uname =~? "Darwin"
    set term=beos-ansi
  else
    set term=builtin_xterm
  endif
  unlet uname
  set t_Co=256
endif

"---------------------------------------------------------------------------
" colorscheme を設定する
"let g:molokai_original=1
colorscheme molokai

"---------------------------------------------------------------------------
" 全角スペース
highlight JpSpace cterm=underline
au BufRead,BufNew * match JpSpace /　/

