#!/bin/bash

for env in dev dev3 test testplus prod; do
echo "updating $config"
svn2 update root/chegg_config/odin
svn2 update root/chegg_config/odin-plugins
done
echo "updating all odin configurations completed"
