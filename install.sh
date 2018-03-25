# Define colors
RED="$(tput setaf 1)"
NORMAL="$(tput sgr0)"

function colorEcho () {
    printf "${RED} $1${NORMAL}\n"
}

colorEcho "Cloning dotfiles..."
git clone git@github.com:goschevski/dotfiles.git
chmod +x ~/dotfiles/bin/*

colorEcho "Setup some OSX settings..."
sh ~/dotfiles/bin/osx.sh 2>&1 > /dev/null

colorEcho "Installing home brew..."
/usr/bin/ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
brew tap homebrew/core
brew tap homebrew/versions
brew tap caskroom/fonts 

colorEcho "Brew install..."
brew install git
brew install tig
brew install pick
brew install ansible
brew install ag
brew install fd
brew install ripgrep
brew install fzf
brew install vifm
brew install ranger
brew install sc-im
brew install archey
brew install figlet
brew install cmatrix
brew install pipes-sh
brew install coreutils
brew install htop
brew install noti
brew install pidof
brew install gnu-sed --default-names
brew install wget
brew install node
brew install imgur-screenshot
brew install w3m
brew install tmux
brew install diff-so-fancy
brew install python3
brew install httpie
brew install siege
brew install pandoc
brew install asciinema
brew install cmus
brew install mpd
brew install ncmpcpp
brew install switchaudio-osx
brew install reattach-to-user-namespace
brew install youtube-dl
brew install ical-buddy
brew install dasht
brew install macvim --with-lua
brew install vim --with-lua
brew linkapps --local macvim

colorEcho "Installing apps using brew cask..."
brew cask install alfred
brew cask install appcleaner
brew cask install firefox-nightly
brew cask install google-chrome
brew cask install google-drive
brew cask install iterm2-nightly
brew cask install mattr-slate
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json
brew cask install skype
brew cask install transmission
brew cask install tunnelblick
brew cask install virtualbox
brew cask install font-iosevka
brew cask install font-fira-code

colorEcho "Installing node global modules..."
npm i -g gulp
npm i -g eslint
npm i -g n
npm i -g how2
npm i -g vtop
npm i -g nodemon
npm i -g yarn

colorEcho "Install dasht docets..."
dasht-docsets-install BackboneJS
dasht-docsets-install JavaScript
dasht-docsets-install Lo-Dash
dasht-docsets-install NodeJS
dasht-docsets-install Vim

colorEcho "Install and setup oh-my-zsh..."
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
mkdir ~/.oh-my-zsh/custom/themes/
ln -s ~/dotfiles/templates/goschevski.zsh-theme ~/.oh-my-zsh/custom/themes/goschevski.zsh-theme

colorEcho "Setup homefiles..."
for file in $(ls ~/dotfiles/homefiles/)
do
    rm -rf ~/.$file
    ln -s ~/dotfiles/homefiles/$file ~/.$file
done

colorEcho "Setup vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall

colorEcho "Setup cmus"
pip3 install mutagen pyobjc
git clone https://github.com/azadkuh/cmus-osx.git ~/.cmus-osx
~/.cmus-osx/setup.py install

colorEcho "Setup mpd and ncmpcpp"
mkdir -p ~/.mpd
mkdir -p ~/.ncmpcpp
ln -s ~/dotfiles/homefiles/ncmpcpp ~/.ncmpcpp/bindings
ln -s ~/dotfiles/homefiles/mpd.conf ~/.mpd/mpd.conf
touch ~/.mpd/mpd.db ~/.mpd/mpd.log ~/.mpd/mpdstate ~/.mpd/mpd.log

colorEcho "Setup hosts files"
sudo su -
echo "0 15 * * * /Users/gosevski/dotfiles/bin/generateHosts" > /tmp/mycron
crontab /tmp/mycron
