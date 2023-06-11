#!/bin/sh -x
TOOLS_DIR=~/.config/nvim/tools
# clean directories
rm -rf $TOOLS_DIR
# create plugin directory
mkdir -p $TOOLS_DIR; cd $TOOLS_DIR
git clone git://github.com/Shougo/dein.vim
cd $TOOLS_DIR/dein.vim
git checkout ver.2.2

