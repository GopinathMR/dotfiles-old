#!/bin/bash
cd $HOME
ln -s dotfiles/.gvimrc .gvimrc
source ~/dotfiles/setup/softwares/setup-init.sh
source ~/dotfiles/setup/softwares/setup-macvim.sh
source ~/dotfiles/setup/softwares/setup-git.sh
source ~/dotfiles/setup/softwares/setup-nodejs.sh
source ~/dotfiles/setup/softwares/dotfiles/setup-configure-stash-cli.sh
source ~/dotfiles/setup/softwares/dotfiles/setup-grc.sh
source ~/dotfiles/setup/softwares/dotfiles/setup-from-web.sh
source ~/dotfiles/setup/softwares/dotfiles/setup-ssh-copy-id.sh
