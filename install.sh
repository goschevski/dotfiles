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
brew tap caskroom/fonts 
brew tap jesseduffield/lazygit

colorEcho "Brew install..."
brew install git
brew install tig
brew install lazygit
brew install pick
brew install ansible
brew install ag
brew install fd
brew install tree
brew install findutils
brew install ripgrep
brew install fzf
brew install vifm
brew install ranger
brew install sc-im
brew install sox
brew install entr
brew install archey
brew install figlet
brew install cmatrix
brew install pipes-sh
brew install coreutils
brew install htop
brew install noti
brew install pidof
brew install gnu-sed
brew install wget
brew install node
brew install imgur-screenshot
brew install w3m
brew install tmux
brew install diff-so-fancy
brew install icdiff
brew install python3
brew install httpie
brew install siege
brew install reattach-to-user-namespace
brew install youtube-dl
brew install ical-buddy
brew install vim
brew install jq

colorEcho "Installing apps using brew cask..."
brew cask install alfred
brew cask install firefox-nightly
brew cask install google-chrome
brew cask install google-backup-and-sync
brew cask install iterm2
brew cask install mattr-slate
brew cask install qlcolorcode
brew cask install qlmarkdown
brew cask install qlstephen
brew cask install quicklook-json
brew cask install transmission
brew cask install tunnelblick
brew cask install font-iosevka
brew cask install font-fira-code
brew cask install font-victor-mono

colorEcho "Installing node global modules..."
npm i -g eslint
npm i -g n
npm i -g nodemon

colorEcho "Install and setup oh-my-zsh..."
git clone https://github.com/chriskempson/base16-shell.git ~/.config/base16-shell
sh -c "$(curl -fsSL https://raw.githubusercontent.com/robbyrussell/oh-my-zsh/master/tools/install.sh)"
ln -s ~/dotfiles/templates/goschevski.zsh-theme ~/.oh-my-zsh/custom/themes/goschevski.zsh-theme
git clone https://github.com/denysdovhan/spaceship-prompt.git "$ZSH_CUSTOM/themes/spaceship-prompt"
ln -s "$ZSH_CUSTOM/themes/spaceship-prompt/spaceship.zsh-theme" "$ZSH_CUSTOM/themes/spaceship.zsh-theme"

colorEcho "Setup homefiles..."
for file in $(ls ~/dotfiles/homefiles/)
do
    rm -rf ~/.$file
    ln -s ~/dotfiles/homefiles/$file ~/.$file
done

colorEcho "Setup vim"
curl -fLo ~/.vim/autoload/plug.vim --create-dirs https://raw.githubusercontent.com/junegunn/vim-plug/master/plug.vim
vim +PlugInstall +qall


colorEcho "Install ansi"
curl -OL git.io/ansi
chmod 755 ansi
sudo mv ansi /usr/local/bin/

# Italic in iterm
colorEcho "Setup italic"
tic -x ~/dotfiles/templates/xterm-256color-italic.terminfo
tic -x ~/dotfiles/templates/tmux-256color.terminfo

colorEcho "Setup hosts files"
sudo su -
echo "0 15 * * * /Users/gosevski/dotfiles/bin/generateHosts" > /tmp/mycron
crontab /tmp/mycron

# Tmux window on C-1, C-2, etc.
# iTerm config -> Profiles -> Keys
# ^1 -> Send Escape Sequence [27;5;49~
# ^2 -> Send Escape Sequence [27;5;50~

# Tmux cmd+K
# iTerm config + Profiles -> Keys
# ⌘ k -> Send Hex Codes 0x1d
