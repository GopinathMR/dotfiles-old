#!/bin/bash

export GOROOT=/usr/local/go
export GOPATH=~/go-code
mkdir -p $GOPATH
export PATH=$PATH:~/dotfiles/bin:$GOPATH/bin:$GOROOT/bin
export GIT_TEMPLATE_DIR=~/dotfiles/git-templates
source ~/dotfiles/bin/set-std-alias.sh
source ~/dotfiles/bin/git-completion.bash
source ~/dotfiles/bin/tmux_completion.sh

#location where MacVim FavMenu.vim plugin stores favorites
export FAVOURITES=~/.vim_favourites
export EDITOR=gvim
alias grep='grep --color=auto'

export HADOOP_PREFIX=~/softwares/hadoop
export HADOOP_HOME="${HADOOP_PREFIX}"
export HADOOP_COMMON_HOME="${HADOOP_PREFIX}"
export HADOOP_CONF_DIR="${HADOOP_PREFIX}/etc/hadoop"
export HADOOP_HDFS_HOME="${HADOOP_PREFIX}"
export HADOOP_MAPRED_HOME="${HADOOP_PREFIX}"
export HADOOP_YARN_HOME="${HADOOP_PREFIX}"

export EMR_HOME=~/softwares/emr
export PATH=$PATH:$HADOOP_HOME/bin:$EMR_HOME:


# function to set title of current terminal tab. ref : http://superuser.com/a/599156
function title {
    TITLE=$*;
    export PROMPT_COMMAND='echo -ne "\033]0;$TITLE\007"'
}

# set terminal current tab name as current directory relative to home directory
function title-auto {
    export PROMPT_COMMAND='echo -ne "\033]0;${PWD/#$HOME/~}\007"'
}

export DEFAULT_JAVA_VERSION=1.7
export JAVA_HOME=`/usr/libexec/java_home -v $DEFAULT_JAVA_VERSION`
export JAVA7_HOME=`/usr/libexec/java_home -v 1.7`
export JAVA8_HOME=`/usr/libexec/java_home -v 1.8`
export VIM_APP_DIR=$HOME/Downloads/MacVim-snapshot-70
export ATLASSIAN_CLI_HOME=$HOME/softwares/atlassian-cli

export PATH=$PATH:$HOME/softwares/apache-tomcat/bin:$HOME/softwares/gradle/bin:$HOME/softwares/cassandra/bin:$HOME/scripts:$HOME/softwares/findbugs/bin:$HOME/softwares/scripts:$ATLASSIAN_CLI_HOME:$HOME/softwares/mvn/bin:$HOME/bin
PATH=/usr/local/bin:$PATH:$HOME/.rvm/bin # Add RVM to PATH for scripting
export CATALINE_HOME=$HOME/softwares/apache-tomcat

title-auto

# If you have any initialization specific to your employer environment, create separate git repo and close as ~/dotfiles-{emplyername} and put a file ~/.employer with one line having employer name.
# If you switch your company, you are not carrying any employer specific scripts with you.
if [ -f $HOME/.employer ] ; then
    export EMPLOYER=`cat $HOME/.employer`
    if [ "$EMPLOYER" != "" ] ; then
        echo "Hello $USER@$EMPLOYER.com "
        source ~/dotfiles-$EMPLOYER/.bashrc
        source ~/dotfiles-$EMPLOYER/bin/set-alias.sh
        export PATH=$PATH:$HOME/dotfiles-$EMPLOYER/bin
    else
        echo "Hello $USER "
    fi
fi
