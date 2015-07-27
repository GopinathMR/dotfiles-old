#!/bin/bash
export odin_major_version=$1
export ODIN_HOME=`pwd`
pushd tools
gradle clean build install -x test javadoc restdoc 
sed -e "s/.*mavenLocal/        mavenLocal/g" $ODIN_HOME/tools/odin/v$odin_major_version/plugin-build.groovy > ~/tmp/plugin-build.groovy && mv ~/tmp/plugin-build.groovy $ODIN_HOME/tools/odin/v$odin_major_version/plugin-build.groovy
if [ -f $ODIN_HOME/tools/odin/v$odin_major_version/sharedlib-build.groovy ];
then
sed -e "s/.*mavenLocal/        mavenLocal/g" $ODIN_HOME/tools/odin/v$odin_major_version/sharedlib-build.groovy > ~/tmp/sharedlib-build.groovy && mv ~/tmp/sharedlib-build.groovy $ODIN_HOME/tools/odin/v$odin_major_version/sharedlib-build.groovy
fi
popd

