#!/bin/bash
for env in dev dev3 test testplus prod; do
svn2 diff $env/root/chegg_config/$1
done
