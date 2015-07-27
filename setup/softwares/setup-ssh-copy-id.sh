#!/bin/bash
if [ ! -f ~/.ssh/id_rsa.pub ]; then
    mkdir -p ~/.ssh
    ssh-keygen
    echo "setting up new private/public key under $HOME/.ssh/id_rsa completed successfully"
fi
curl -L https://raw.githubusercontent.com/beautifulcode/ssh-copy-id-for-OSX/master/install.sh | sh
echo "ssh-copy-id is installed successfully to Mac"
