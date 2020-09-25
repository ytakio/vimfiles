#!/bin/bash

##
# Local root
export PREFIX=$HOME/.local

##
# Local library
export CPATH=${PREFIX}/include${CPATH:+:$CPATH}
export PKG_CONFIG_PATH=${PREFIX}/lib/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}
export LIBRARY_PATH=${PREFIX}/lib${LIBRARY_PATH:+:$LIBRARY_PATH}

export PKG_CONFIG_PATH=${PREFIX}/lib/x86_64-linux-gnu/pkgconfig${PKG_CONFIG_PATH:+:$PKG_CONFIG_PATH}
export LIBRARY_PATH=${PREFIX}/lib/x86_64-linux-gnu${LIBRARY_PATH:+:$LIBRARY_PATH}

##
# Chromium
export PATH=${PREFIX}/depot_tools:$PATH

##
# Node.js
export PATH=${PREFIX}/node/current/bin:$PATH

##
# Local shared library
export LD_LIBRARY_PATH=$LIBRARY_PATH

export PATH="$HOME/.cargo/bin:$PATH"

export PATH=$PREFIX/tmc2/bin:$PATH

##
# CUDA
export PATH=/usr/local/cuda/bin${PATH:+:${PATH}}
export LD_LIBRARY_PATH=/usr/local/cuda/lib64${LD_LIBRARY_PATH:+:${LD_LIBRARY_PATH}}
