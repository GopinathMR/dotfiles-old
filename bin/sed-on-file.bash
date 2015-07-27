#!/bin/bash
export sedExpr=$1
export fileName=$2
echo "filename is $fileName"
sed -e "$sedExpr" $fileName > /tmp/a.txt
rm $fileName
mv /tmp/a.txt $fileName
