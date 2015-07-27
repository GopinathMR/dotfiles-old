#!/bin/bash
echo "Installing Atlassian Stash CLI using sudo, enter your Mac a/c password (if prompted)"
sudo gem install atlassian-stash
echo "Installing Atlassian Stash CLI.. completed"

echo "Configuring Stash CLI to chegg stash repo"
echo "Enter stash account password for user $USER@chegg.com and enter stash URL as https://stash.cheggnet.com"
stash configure --username $USER 
#--stash_url http://stash.cheggnet.com
