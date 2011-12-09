filetype off
set rtp+=$HOME/vimfiles/vundle
call vundle#rc()

" My Bundles here:
"
" original repos on github
" ie. Bundle 'username/repo'
"Bundle 'Shougo/unite.vim'
Bundle 'koron/chalice'
Bundle 'vim-jp/vimdoc-ja'
Bundle 'msanders/snipmate.vim'

" vim-scripts repos
" ie. Bundle 'scriptname'
Bundle 'ScrollColors'
"Bundle 'Source-Explorer-srcexpl.vim'
Bundle 'taglist.vim'
Bundle 'The-NERD-tree'
"Bundle 'trinity.vim'
Bundle 'grep.vim'
"Bundle 'OmniCppComplete'

" non github repos
" ie. Bundle 'git://git.repo/file.git'

filetype plugin indent on     " required!

" Brief help
" :BundleList          - list configured bundles
" :BundleInstall(!)    - install(update) bundles
" :BundleSearch(!) foo - search(or refresh cache first) for foo
" :BundleClean(!)      - confirm(or auto-approve) removal of unused bundles
"
" see :h vundle for more details or wiki for FAQ
" NOTE: comments after Bundle command are not allowed..

