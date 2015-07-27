#!/bin/bash
for env in dev dev3 test testplus prod; do
svn2 update $env/root/chegg_config/$1
done
gvim dev3/root/chegg_config/$1 dev/root/chegg_config/$1 test/root/chegg_config/$1 testplus/root/chegg_config/$1 prod/root/chegg_config/$1
