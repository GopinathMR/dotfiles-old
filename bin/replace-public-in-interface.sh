#!/bin/bash
export fileName=$1
echo "filename is $fileName"
sed -e "s/public //g" $fileName | sed -e "s/interface/public interface/g" > /tmp/a.txt
rm $fileName
mv /tmp/a.txt $fileName
