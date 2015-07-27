#!/bin/bash
# Commandline script to create and delete eclipse projects for whole git repo containing many gradle sub-projects.
export cmd=$1
if [ "$cmd" = "" ]
then
    echo "Specify valid command"
    echo "Usage : greclipse.bash create|delete"
    exit 1;
fi
export current_dir=`pwd`
for gradleFile in $(find . -name build.gradle)
do
    subProjectDir=`dirname $gradleFile`
    if [ "$subProjectDir" != "." ]
    then
        subProjectDir=`basename $subProjectDir`
        if [ "$cmd" = "create" ]
        then
        echo "test"
            echo "#### GENERATING ECLIPSE FILES FOR $subProjectDir ####"
            cd $subProjectDir
            gradle eclipse
            cd $current_dir
        elif [ "$cmd" = "delete" ]
        then
            echo "#### CLEANUP ECLIPSE FILES FOR $subProjectDir ####"
            cd $subProjectDir
            rm -rf .classpath .project .settings
            cd $current_dir
        else
            echo "#### invalid command $cmd"
        fi
    fi
done
