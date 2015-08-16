" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)

" Use Vim settings, rather than Vi settings (much better!).
" This must be first, because it changes other options as a side effect.
set nocompatible

"---------------------------------------------------------------------------
" vimfilesディレクトリをruntimepathへ追加する。
if has('vim_starting')
  set rtp+=$HOME/vimfiles
endif

"---------------------------------------------------------------------------
" 各種設定を始める前に日本語向けエンコーディング設定をしておく
source $HOME/vimfiles/settings/japanese.vim

"---------------------------------------------------------------------------
" メニューファイルが存在しない場合は予め'guioptions'を調整しておく
if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif

"---------------------------------------------------------------------------
" 前設定(読み込み順は保証されない)
runtime! settings/preloads/**/*.vim
" plugin manager
source $HOME/vimfiles/settings/bundle.vim
" 後設定(読み込み順は保証されない)
runtime! settings/postloads/**/*.vim
