# Define colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"

function printStatus () {
    if [ $? -eq 0 ]; then
        printf "${GREEN} Done!${NORMAL}\n"
    else
        printf "${RED} Error!${NORMAL}\n"
    fi
}

echo "1. Setup some OSX settings...\c"
sh ~/dotfiles/bin/osx.sh 2>&1 > /dev/null
printStatus

echo "2. Cloning dotfiles...\c"
git clone git@github.com:goschevski/dotfiles.git --quiet
printStatus

echo "3. Installing home brew...\c"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap caskroom/versions 2>&1 > /dev/null
brew tap homebrew/dupes 2>&1 > /dev/null
brew tap homebrew/versions 2>&1 > /dev/null
brew tap homebrew/homebrew-php 2>&1 > /dev/null
printStatus

echo "4. Brew install...\c"
brew install git 2>&1 > /dev/null
brew install ack 2>&1 > /dev/null
brew install wget 2>&1 > /dev/null
brew install node 2>&1 > /dev/null
brew install macvim --with-lua 2>&1 > /dev/null
brew install youtube-dl 2>&1 > /dev/null
brew install ical-buddy 2>&1 > /dev/null
brew install caskroom/cask/brew-cask 2>&1 > /dev/null
brew install vim --with-lua 2>&1 > /dev/null
sudo mv /usr/bin/vim /usr/bin/vim73 2>&1 > /dev/null
brew linkapps 2>&1 > /dev/null
printStatus

echo "5. Installing apps using brew cask...\c"
brew cask install alfred 2>&1 > /dev/null
brew cask install appcleaner 2>&1 > /dev/null
brew cask install cloudup 2>&1 > /dev/null
brew cask install firefox 2>&1 > /dev/null
brew cask install google-chrome 2>&1 > /dev/null
brew cask install google-drive 2>&1 > /dev/null
brew cask install iterm2 2>&1 > /dev/null
brew cask install mattr-slate 2>&1 > /dev/null
brew cask install qlcolorcode 2>&1 > /dev/null
brew cask install qlmarkdown 2>&1 > /dev/null
brew cask install qlstephen 2>&1 > /dev/null
brew cask install quicklook-json 2>&1 > /dev/null
brew cask install skype 2>&1 > /dev/null
brew cask install sourcetree 2>&1 > /dev/null
brew cask install transmission 2>&1 > /dev/null
brew cask install tunnelblick 2>&1 > /dev/null
brew cask install virtualbox 2>&1 > /dev/null
brew cask install vlc 2>&1 > /dev/null
printStatus

echo "6. Installing node global modules...\c"
npm i -g gulp 2>&1 > /dev/null
npm i -g jscs 2>&1 > /dev/null
npm i -g jshint 2>&1 > /dev/null
npm i -g n 2>&1 > /dev/null
npm i -g bower 2>&1 > /dev/null
npm i -g nodemon 2>&1 > /dev/null
printStatus

echo "7. Install and setup oh-my-zsh...\c"
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)" 2>&1 > /dev/null
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions --quiet
mkdir ~/.oh-my-zsh/custom/themes/ 2>&1 > /dev/null
ln -s ~/dotfiles/goschevski.zsh-theme ~/.oh-my-zsh/custom/themes/goschevski.zsh-theme 2>&1 > /dev/null
printStatus

echo "8. Setup homefiles...\c"
for file in $(ls ~/dotfiles/homefiles/)
do
    rm -rf ~/.$file 2>&1 > /dev/null
    ln -s ~/dotfiles/homefiles/$file ~/.$file 2>&1 > /dev/null
done
printStatus

echo "9. Setup Vundle and Vim...\c"
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim --quiet
vim +PluginInstall +qall
printStatus
