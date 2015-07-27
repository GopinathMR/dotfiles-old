#!/bin/bash
# Very often we face issue where developers add a new property for an environment config file, but forget to add it to other env configs.  This results in either application startup failure (if they use Spring Framework with autowire) or application behave differently.
# Here is the fix, run this on both properties and see what properties you are missing in each
export p1=$1
export p2=$2
export f1=`basename $p1`
export f2=`basename $p2`
cat $p1 | grep "=" | sed -e "s/=.*/=/g" | sort > /tmp/1.$f1
cat $p2 | grep "=" | sed -e "s/=.*/=/g" | sort > /tmp/2.$f2
diff -u -w -i /tmp/1.$f1 /tmp/2.$f2
