#!/bin/bash
export odin_major_version=$1
export ODIN_HOME=`pwd`
find ~/.m2/repository/com/chegg/platform -name "$odin_major_version\.*SNAPSHOT" -type d | xargs rm -rf
rm -rf ~/.gradle/caches/artifacts-26/filestore/com.chegg.platform/odin-*
#gradle clean build install test testIntegration
gradle clean build install -x test -x testIntegration -x javadoc -x restdoc 

if [ -f $ODIN_HOME/tools/odin/v$odin_major_version/plugin-build.groovy ];
then
echo "uncommenting mavenLocal() in $ODIN_HOME/tools/odin/v$odin_major_version/plugin-build.groovy"
sed -e "s/.*mavenLocal/        mavenLocal/g" $ODIN_HOME/tools/odin/v$odin_major_version/plugin-build.groovy > ~/tmp/plugin-build.groovy && mv ~/tmp/plugin-build.groovy $ODIN_HOME/tools/odin/v$odin_major_version/plugin-build.groovy
fi

if [ -f $ODIN_HOME/tools/odin/v$odin_major_version/sharedlib-build.groovy ];
then
  echo "uncommenting mavenLocal() in $ODIN_HOME/tools/odin/v$odin_major_version/sharedlib-build.groovy"
  sed -e "s/.*mavenLocal/        mavenLocal/g" $ODIN_HOME/tools/odin/v$odin_major_version/sharedlib-build.groovy > ~/tmp/sharedlib-build.groovy && mv ~/tmp/sharedlib-build.groovy $ODIN_HOME/tools/odin/v$odin_major_version/sharedlib-build.groovy
fi
