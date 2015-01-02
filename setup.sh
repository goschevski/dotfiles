function loudEcho () {
    echo "------------------------------------"
    echo $1
    echo "------------------------------------"
}

loudEcho "Make me owner of important folders"
sudo chown -R `whoami` ~/
sudo chown -R `whoami` /usr/local

loudEcho "Setup some OSX settings"
sudo chmod +x ~/dotfiles/osx.sh
~/dotfiles/osx.sh

loudEcho "Installing home brew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

loudEcho "Brew doctor & update..."
brew doctor && brew update

loudEcho "Brew install..."
brew install git ack wget node macvim caskroom/cask/brew-cask
brew linkapps
brew tap casidiablo/homebrew-custom

loudEcho "Brew install vim..."
brew install vim --with-lua
sudo mv /usr/bin/vim /usr/bin/vim73

loudEcho "Brew cask..."
brew cask install adium
brew cask install appcleaner
brew cask install popcorn-time
brew cask install cyberduck
brew cask install cloud
brew cask install hyperswitch
brew cask install sketch
brew cask install slate
brew cask install sparrow
brew cask install twitterrific
brew cask install xtrafinder
brew cask install alfred
brew cask install caffeine
brew cask install google-chrome
brew cask install iterm2
brew cask install skype
brew cask install sourcetree
brew cask install tunnelblick
brew cask install virtualbox
brew cask install qlcolorcode
brew cask install qlstephen
brew cask install qlmarkdown
brew cask install quicklook-json
brew cask install vlc
brew cask install dropbox
brew cask install copy
brew cask install transmission

loudEcho "NPM install global modules..."
sudo npm i -g gulp grunt-cli jscs jshint nd n json david bower express-generator nodemon

loudEcho "Cloning dotfiles..."
git clone git@github.com:goschevski/dotfiles.git ~/dotfiles --quiet

loudEcho "Installing oh-my-zsh..."
rm -rf ~/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh --quiet
sudo chsh -s /bin/zsh

loudEcho "Installing zsh-autosuggestions..."
rm -rf ~/.zsh-autosuggestions
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions --quiet

loudEcho "Setup goschevski zsh theme..."
mkdir ~/.oh-my-zsh/custom/themes/
ln -s ~/dotfiles/goschevski.zsh-theme ~/.oh-my-zsh/custom/themes/goschevski.zsh-theme

loudEcho "Setup homefiles..."
for file in $(ls ~/dotfiles/homefiles/)
do
    rm -rf ~/.$file
    ln -s ~/dotfiles/homefiles/$file ~/.$file
done

loudEcho "Cloning vundle..."
rm -rf ~/dotfiles/vim/bundle/*
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim --quiet
