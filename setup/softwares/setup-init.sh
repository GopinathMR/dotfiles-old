#!/bin/bash
# first script to be executed after cloning
pushd $HOME

if [ ! -f ~/.bashrc ]; then
    ln -s ~/dotfiles/.bashrc ~/.bashrc
fi

if [ ! -f ~/.inputrc ]; then
    ln -s ~/dotfiles/.inputrc ~/.inputrc
fi

if [ ! -f ~/.gvimrc ]; then
    ln -s ~/dotfiles/.gvimrc ~/.gvimrc
fi

if [ ! -f ~/.vrapperrc ]; then
    ln -s ~/dotfiles/.vrapperrc ~/.vrapperrc
fi

popd
echo "setting up initial files completed for .bashrc , .inputrc, .gvimrc , .vrapperrc under $HOME"
