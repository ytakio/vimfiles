" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)

"---------------------------------------------------------------------------
" コンソールでのカラー表示のための設定(暫定的にUNIX専用)
if has('unix') && !has('gui_running')
  let uname = system('uname')
  if uname =~? "linux"
    "set term=builtin_linux
    set term=xterm
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
" 基本設定
syntax enable
set bg=dark

"---------------------------------------------------------------------------
" colorscheme を設定する
let g:solarized_termcolors=16
let g:solarized_termtrans=1
let g:solarized_contrast="high"
let g:solarized_italic=0
let g:solarized_visibility="normal"
colorscheme solarized

"---------------------------------------------------------------------------
" 見にくいハイライトを上書き
"---------------------------------------------------------------------------
" 全角スペース
highlight JpSpace cterm=underline
au BufRead,BufNew * match JpSpace /　/

"---------------------------------------------------------------------------
" For Doxygen
"---------------------------------------------------------------------------
let g:load_doxygen_syntax=1

