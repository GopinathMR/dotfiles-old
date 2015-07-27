export BREW_PATH=`which brew`
if [ "$BREW_PATH" == ""]; then
    ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
fi
brew bundle ~/dotfiles/setup/softwares/Brewfile
