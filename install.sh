# Define colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"

function echoGreen () {
    printf "${RED} $1${NORMAL}\n"
}

echoGreen "1. Cloning dotfiles..."
git clone git@github.com:goschevski/dotfiles.git --quiet
chmod +x ~/dotfiles/bin/*

echoGreen "2. Setup some OSX settings..."
sh ~/dotfiles/bin/osx.sh 2>&1 > /dev/null

echoGreen "3. Installing home brew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/versions
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php
brew tap thoughtbot/formulae

echoGreen "4. Brew install..."
brew install git
brew install tig
brew install pick
brew install ack
brew install gnu-sed --default-names
brew install wget
brew install node
brew install tmux
brew install httpie
brew install reattach-to-user-namespace
brew install macvim --with-lua
brew install youtube-dl
brew install ical-buddy
brew install caskroom/cask/brew-cask
brew install vim --with-lua
sudo mv /usr/bin/vim /usr/bin/vim73
brew linkapps

echoGreen "5. Installing apps using brew cask..."
brew cask install alfred
brew cask install appcleaner
brew cask install cloudup
brew cask install firefox
brew cask install google-chrome
brew cask install google-drive
brew cask install iterm2-beta
brew cask install mattr-slate
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json
brew cask install skype
brew cask install sourcetree
brew cask install transmission
brew cask install tunnelblick
brew cask install virtualbox
brew cask install vlc

echoGreen "6. Installing node global modules..."
npm i -g gulp
npm i -g jscs
npm i -g jshint
npm i -g n
npm i -g bower
npm i -g nodemon

echoGreen "7. Setup homefiles..."
for file in $(ls ~/dotfiles/homefiles/)
do
    rm -rf ~/.$file
    ln -s ~/dotfiles/homefiles/$file ~/.$file
done

echoGreen "8. Setup Vundle and Vim..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim --quiet
vim +PluginInstall +qall

echoGreen "9. Install tmux plugin manager..."
git clone https://github.com/tmux-plugins/tpm ~/.tmux/plugins/tpm --quiet

echoGreen "10. Install and setup oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions --quiet
mkdir ~/.oh-my-zsh/custom/themes/
ln -s ~/dotfiles/goschevski.zsh-theme ~/.oh-my-zsh/custom/themes/goschevski.zsh-theme
