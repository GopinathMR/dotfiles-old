#!/bin/bash
alias macvim="mvim -f -p1"
alias gvim="macvim"
alias cdgm="cd ~/git/ms"
alias cdgp="cd ~/git/PI"

# Use pfind instead of find command to search in current directory.  This returns absolute path of the files to copy/paste anywhere instead of relative path returned by find.
function pfind {
    find `pwd` $*
}
alias pd="pushd"

#node.json modules available as CLI tools.
#sudo brew install node
#npm install json-diff
alias json-diff="node ~/softwares/nodejs/node_modules/json-diff/bin/json-diff"
#npm install prettyjson
alias prettyjson="node ~/softwares/nodejs/node_modules/prettyjson/bin/prettyjson --string=red --keys=blue --dash=yellow --number=green --indent=4"

#set alias for standard commands to color-code using grc @see ~/setup/softwares/setup-grc.sh
#reference : http://michaelheap.com/grc/
alias colourify="grc -es --colour=auto"
alias configure='colourify ./configure'
alias diff='colourify diff '
alias make='colourify make'
alias gcc='colourify gcc'
alias g++='colourify g++'
alias netstat='colourify netstat'
alias ping='colourify ping'
alias traceroute='colourify traceroute'
alias curl='colourify curl'
alias last='colourify last'
alias ps='colourify ps'
alias ifconfig='colourify ifconfig'
alias ls='colourify ls'
alias more='colourify more'
alias tail='colourify tail'
alias less='colourify less -R --color=always'

#standard git aliases
alias gs='git status'
alias gb='git branch'
alias ga='git add -u'
alias gl='git glog'
alias gd='git diff'
alias gfo='git fetch origin'



alias enable_java8='export JAVA_HOME=/Library/Java/JavaVirtualMachines/jdk1.8.0_45.jdk/Contents/Home && export PATH=$JAVA_HOME/bin:$PATH'

#ref : http://www.clevertakes.com/blog/2012/04/08/how-to-set-up-macvim-as-your-visual-editor/
export VISUAL='mvim -f'

#ref : http://www.techrepublic.com/blog/linux-and-open-source/using-vi-key-bindings-in-bash-and-zsh/
bindkey -v
