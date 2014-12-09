function loudEcho () {
    echo "------------------------------------"
    echo $1
    echo "------------------------------------"
}

loudEcho "Make me owner of important folders"
sudo chown -R `whoami` ~/
sudo chown -R `whoami` /usr/local

loudEcho "Installing home brew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

loudEcho "Brew doctor & update..."
brew doctor && brew update

loudEcho "Brew install shell tools..."
brew install ack wget node caskroom/cask/brew-cask

loudEcho "Brew install vim..."
brew install vim --with-lua
sudo mv /usr/bin/vim /usr/bin/vim73

loudEcho "Brew cask install apps..."
brew cask install adium appcleaner cloud hyperswitch sketch slate sparrow twitterrific xtrafinder alfred caffeine google-chrome iterm2 skype sourcetree tunnelblick virtualbox qlcolorcode qlstephen qlmarkdown quicklook-json vlc

loudEcho "NPM install global modules..."
sudo npm i -g gulp grunt-cli jscs jshint nd n json david bower express-generator nodemon puer rwdperf

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
