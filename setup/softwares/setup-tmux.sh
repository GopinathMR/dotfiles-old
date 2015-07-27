#!/bin/bash
# setup tmux plugin manager and install all plugins configured in ~/.tmux.conf
if [ ! -d ~/.tmux/plugins/tpm ];then
    mkdir -p ~/.tmux/plugins/tpm
    pushd ~/.tmux/plugins/tpm
    git clone https://github.com/tmux-plugins/tpm .
    popd
fi
if [ ! -f ~/.tmux.conf ]; then
    pushd $HOME
    ln -s ~/dotfiles/.tmux.conf ~/.tmux.conf
    popd
fi
chmod 755 ~/.tmux/plugins/tpm/scripts/install_plugins.sh
source ~/.tmux/plugins/tpm/scripts/install_plugins.sh
