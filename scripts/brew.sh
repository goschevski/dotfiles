echo "\033[0;34mInstalling home brew...\033[0m"
ruby -e "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/master/install)"
echo "\033[0;34mBrew doctor & update...\033[0m"
brew doctor && brew update
echo "\033[0;34mBrew install shell tools...\033[0m"
brew install ack wget ctags node caskroom/cask/brew-cask
echo "\033[0;34mBrew install vim...\033[0m"
brew install vim --with-lua
echo "\033[0;34mBrew cask install apps...\033[0m"
brew cask install adium appcleaner cloud hyperswitch sketch slate sparrow twitterrific xtrafinder alfred caffeine google-chrome iterm2 skype sourcetree tunnelblick vlc
echo "\033[0;34mNPM install global modules...\033[0m"
sudo npm i -g gulp grunt-cli jscs jshint nd n json david bower express-generator
