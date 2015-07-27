#!/bin/bash
cd ~/software/versioned/
sudo brew install node
export NODEJS_VERSION=`node --version`
cd ~/software
ln -s versioned/nodejs-$NODEJS_VERSION nodejs
cd ~/software/nodejs
npm install json-diff
npm install prettyjson
