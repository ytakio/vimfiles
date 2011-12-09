" vim:set ts=8 sts=2 sw=2 tw=0: (この行に関しては:help modelineを参照)

"---------------------------------------------------------------------------
" vimfilesディレクトリをruntimepathへ追加する。
set rtp+=$HOME/vimfiles

"---------------------------------------------------------------------------
" 各種設定を始める前に日本語向けエンコーディング設定をしておく
source $HOME/vimfiles/settings/japanese.vim

"---------------------------------------------------------------------------
" メニューファイルが存在しない場合は予め'guioptions'を調整しておく
if 1 && !filereadable($VIMRUNTIME . '/menu.vim') && has('gui_running')
  set guioptions+=M
endif

"---------------------------------------------------------------------------
" Bram氏の提供する設定例をインクルード (別ファイル:vimrc_example.vim)。これ
" 以前にg:no_vimrc_exampleに非0な値を設定しておけばインクルードはしない。
if 1 && (!exists('g:no_vimrc_example') || g:no_vimrc_example == 0)
  if &guioptions !~# "M"
    " vimrc_example.vimを読み込む時はguioptionsにMフラグをつけて、syntax on
    " やfiletype plugin onが引き起こすmenu.vimの読み込みを避ける。こうしない
    " とencに対応するメニューファイルが読み込まれてしまい、これの後で読み込
    " まれる.vimrcでencが設定された場合にその設定が反映されずメニューが文字
    " 化けてしまう。
    set guioptions+=M
    source $VIMRUNTIME/vimrc_example.vim
    set guioptions-=M
  else
    source $VIMRUNTIME/vimrc_example.vim
  endif
endif

"---------------------------------------------------------------------------
" 設定スクリプトの読み込み
" 読み込み順は保証されない
for dot_vim in split(glob($HOME.'/vimfiles/settings/bulkload/*.vim'), '\n')
  execute 'source' dot_vim
endfor

" 最後に全キーマッピングを設定
source $HOME/vimfiles/settings/keymaps.vim

