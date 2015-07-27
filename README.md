# dotfiles

This git repo contains useful script required to setup new mac with useful tools and be productive as Java engineer

@autor : https://twitter.com/mr_gopinath

This will have all preferences files required for using different softwares like

* Vim profile file .vimrc / .gvimrc
* Environment variables initialization
* Useful commands
* Useful scripts to work with Atlassian products (stash, jira etc).


# First time setup
* create a file $HOME/.employer which contains name of your employer (typically email domain without .com suffix.)
    * E.g., `cat ~/.employer`
    
        ```
        chegg
        ```
* after cloning this repo, make sure to run this script first time
    * `~/dotfiles/setup/setup.sh`
* git config initialization
    * In $HOME/.gitconfig add a line as below to include other .gitconfig (ref : [http://stackoverflow.com/a/9733277/935706](http://stackoverflow.com/a/9733277/935706) )            
        ```
        [include]
        	path = ~/dotfiles/.gitconfig
        ```
