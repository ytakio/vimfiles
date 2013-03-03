#!/bin/sh
mkdir -p ~/.vim/bundle
cd ~/.vim/bundle
git clone git://github.com/Shougo/neobundle.vim.git
cd neobundle.vim
git checkout ver.2.1

