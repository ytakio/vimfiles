#!/bin/sh -x
PLUGIN_DIR=~/.config/nvim/plugins/repos/github.com/Shougo
# clean directories
rm -rf $PLUGIN_DIR
# create plugin directory
mkdir -p $PLUGIN_DIR
cd $PLUGIN_DIR
git clone git://github.com/Shougo/dein.vim
cd dein.vim
#git checkout ver.2.1

