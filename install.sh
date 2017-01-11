# Define colors
RED="$(tput setaf 1)"
GREEN="$(tput setaf 2)"
NORMAL="$(tput sgr0)"

function echoGreen () {
    printf "${RED} $1${NORMAL}\n"
}

echoGreen "1. Cloning dotfiles..."
git clone git@github.com:goschevski/dotfiles.git
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
brew install ag
brew install coreutils
brew install gnu-sed --default-names
brew install wget
brew install node
brew install imgur-screenshot
brew install w3m
brew install tmux
brew install diff-so-fancy
brew install python3
brew install httpie
brew install cmus
brew install switchaudio-osx
brew install reattach-to-user-namespace
brew install youtube-dl
brew install ical-buddy
brew install caskroom/cask/brew-cask
brew install macvim --with-lua
brew install vim --with-lua
brew linkapps --local macvim

echoGreen "5. Installing apps using brew cask..."
brew cask install alfred
brew cask install appcleaner
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
npm i -g eslint
npm i -g n
npm i -g how2
npm i -g nodemon
npm i -g yarn

echoGreen "7. Install and setup oh-my-zsh..."
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir ~/.oh-my-zsh/custom/themes/
ln -s ~/dotfiles/goschevski.zsh-theme ~/.oh-my-zsh/custom/themes/goschevski.zsh-theme

echoGreen "8. Setup homefiles..."
for file in $(ls ~/dotfiles/homefiles/)
do
    rm -rf ~/.$file
    ln -s ~/dotfiles/homefiles/$file ~/.$file
done

echoGreen "9. Setup vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

echoGreen "10. Setup cmus"
pip3 install mutagen pyobjc
git clone https://github.com/azadkuh/cmus-osx.git ~/.cmus-osx
~/.cmus-osx/setup.py install
