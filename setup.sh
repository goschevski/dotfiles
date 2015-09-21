function loudEcho () {
    echo "------------------------------------"
    echo $1
    echo "------------------------------------"
}

loudEcho "Cloning dotfiles..."
git clone git@github.com:goschevski/dotfiles.git ~/dotfiles

loudEcho "Setup some OSX settings..."
sudo chmod +x ~/dotfiles/osx.sh
~/dotfiles/osx.sh

loudEcho "Installing home brew..."
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"

loudEcho "Brew tap..."
brew tap caskroom/versions
brew tap homebrew/dupes
brew tap homebrew/versions
brew tap homebrew/homebrew-php

loudEcho "Brew install..."
brews=(
    git
    php56
    ack
    wget
    node
    macvim
    youtube-dl
    caskroom/cask/brew-cask
)
brew install ${brews[@]}
brew linkapps

loudEcho "Brew install vim..."
brew install vim --with-lua
sudo mv /usr/bin/vim /usr/bin/vim73

loudEcho "Brew cask..."
apps=(
    adium
    alfred
    appcleaner
    cloudup
    firefox
    google-chrome
    google-drive
    iterm2
    itsycal
    mattr-slate
    qlcolorcode
    qlmarkdown
    qlstephen
    quicklook-json
    skype
    sourcetree
    transmission
    tunnelblick
    twitterrific
    virtualbox
    vlc
    xtrafinder
)
brew cask install ${apps[@]}

loudEcho "NPM install global modules..."
npmModules=(
    gulp
    jscs
    jshint
    n
    bower
    nodemon
)
npm i -g ${npmModules[@]}

loudEcho "Download sphp (php version switcher)..."
curl -L https://raw.githubusercontent.com/conradkleinespel/sphp-osx/master/sphp > /usr/local/bin/sphp
sudo chmod +x /usr/local/bin/sphp

loudEcho "Installing oh-my-zsh..."
sh -c "$(curl -fsSL https://raw.github.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"

loudEcho "Installing zsh-autosuggestions..."
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions --quiet

# loudEcho "Setup goschevski zsh theme..."
mkdir ~/.oh-my-zsh/custom/themes/
ln -s ~/dotfiles/goschevski.zsh-theme ~/.oh-my-zsh/custom/themes/goschevski.zsh-theme

loudEcho "Setup homefiles..."
for file in $(ls ~/dotfiles/homefiles/)
do
    rm -rf ~/.$file
    ln -s ~/dotfiles/homefiles/$file ~/.$file
done

loudEcho "Cloning vundle..."
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim --quiet

loudEcho "Installing Vim plugins..."
vim +PluginInstall +qall
