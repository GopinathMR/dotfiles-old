#!/bin/bash
# Visit https://bobswift.atlassian.net/wiki/display/JCLI/Examples for Jira CLI examples
if [ "$ATLASSIAN_CLI_HOME" != "" ]
then
    if [ -f ~/.atlassianpassword ]; then
        export password=`cat ~/.atlassianpassword | base64 --decode`
    else 
        echo "Enter password to connect to Jira as user '$USER@chegg.com' : "
        read -s password
    fi
    java -jar $ATLASSIAN_CLI_HOME/lib/jira-cli-3.9.0-SNAPSHOT.jar --server http://jira.cheggnet.com --user "$USER@chegg.com" --password $password "$@"
else
    echo "ATLASSIAN_CLI_HOME environment variable is not set"
fi
