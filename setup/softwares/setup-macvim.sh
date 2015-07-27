#!/bin/bash
cd ~/software/versioned/
sudo brew install macvim --override-system-vim
export GIT_VERSION=`macvim --version | sed -e "s/.*version //g" | sed -e "s/ .*//g"`
export MACVIM_VERSION=`mvim --help | head -1 | sed -e "s/.*IMproved //g" | sed -e "s/ .*//g"`
cd ~/software
ln -s versioned/macvim-$GIT_VERSION macvim
cd ~/software/macvim
