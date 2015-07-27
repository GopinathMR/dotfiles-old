#!/bin/bash
mkdir -p {dev,dev3,test,testplus,prod}

for env in dev dev3 test testplus prod; do
ln -s ~/configs/java_configs/$config/root/chegg_config/odin dev/odin
ln -s ~/configs/java_configs/$config/root/chegg_config/odin-plugins dev/odin-plugins
done
cp ~/dotfiles/bin/update-configs.sh .
