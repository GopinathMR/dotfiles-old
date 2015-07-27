#!/bin/bash
# This script assumes you make release from 'master' branch and your latest code is in 'develop' branch.

if [ "$#" -ne 2 ]; then
    echo "Usage : check-tickets-ready-for-release.sh {git directory} {ticket prefix}" >&2
    exit 1
fi
if [ -d $1 ]; then
pushd $1 > /dev/null
export repo_name=`git remote show origin | grep "Fetch URL" | awk '{print $3}' | awk -F "/" '{print $5}' | sed -e "s/\.git//g"`
echo "Tickets ready for release in '$repo_name'"
git checkout master --quiet > /dev/null
export success=$?
if [[ $success -ne 0 ]]; then
    echo "$1 is not a git directory">&2
    popd > /dev/null
    exit 1
fi
git pull origin master --quiet > /dev/null
git checkout develop --quiet
git pull origin develop --quiet > /dev/null
git shortlog develop ^master --no-merges | grep $2 | sort | awk  '{ print $1}' | uniq
popd > /dev/null
echo "===================================="
else
    echo "directory $1 doesn't exist" >&2
fi
