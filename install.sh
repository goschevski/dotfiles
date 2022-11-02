# Install ansi
curl -OL git.io/ansi
chmod 755 ansi
sudo mv ansi /usr/local/bin/

ansi --green "Cloning dotfiles..."
git clone git@github.com:goschevski/dotfiles.git ~/dotfiles
chmod +x ~/dotfiles/bin/*

ansi --green "Installing home brew..."
/bin/bash -c "$(curl -fsSL https://raw.githubusercontent.com/Homebrew/install/HEAD/install.sh)"
brew tap homebrew/core
brew tap homebrew/cask
brew tap homebrew/cask-versions
brew tap homebrew/cask-fonts

ansi --green "Brew install..."
brew install git
brew install fnm
brew install fd
brew install tree
brew install findutils
brew install ripgrep
brew install fzf
brew install gnu-sed
brew install wget
brew install node
brew install go
brew install coreutils
brew install noti
brew install tmux
brew install diff-so-fancy
brew install icdiff
brew install python3
brew install httpie
brew install youtube-dl
brew install yt-dlp
brew install ffmpeg
brew install vim
brew install jq
brew install awscli
brew install lsd
brew install bat
brew install starship
# brew install tig
# brew install jesseduffield/lazygit/lazygit
# brew install jesseduffield/lazydocker/lazydocker
# brew install pick
# brew install ansible
# brew install ag
# brew install vifm
# brew install ranger
# brew install lf
# brew install sc-im
# brew install sox
# brew install entr
# brew install archey
# brew install figlet
# brew install cmatrix
# brew install pipes-sh
# brew install htop
# brew install pidof
# brew install imgur-screenshot
# brew install w3m
# brew install siege
# brew install reattach-to-user-namespace
# brew install ical-buddy

ansi --green "Installing apps using brew cask..."
brew install --cask raycast
brew install --cask kitty
brew install --cask google-drive
brew install --cask viscosity
brew install --cask slack
brew install --cask microsoft-edge
brew install --cask zoom
brew install --cask docker
brew install --cask sketch
brew install --cask parallels
brew install --cask monitorcontrol
brew install --cask notion
brew install --cask font-victor-mono
# brew install --cask homebrew/cask-versions/firefox-nightly
# brew install --cask google-chrome
# brew install --cask iterm2
# brew install --cask mattr-slate
# brew install --cask qlcolorcode
# brew install --cask qlmarkdown
# brew install --cask qlstephen
# brew install --cask quicklook-json
# brew install --cask transmission
# brew install --cask numi
# brew cask install font-iosevka
# brew cask install font-fira-code

ansi --green "Installing node global modules..."
# npm i -g vtop
# npm i -g surge
npm i -g @vue/cli

ansi --green "Setup homefiles..."
for file in $(ls ~/dotfiles/homefiles/)
do
    rm -rf ~/.$file
    ln -s ~/dotfiles/homefiles/$file ~/.$file
done

ansi --green "Setup nvim..."
ln -s ~/dotfiles/nvim/ ~/.config/

ansi --green "Setup kitty..."
mkdir -p ~/.config/kitty
ln -s ~/dotfiles/templates/kitty.conf ~/.config/kitty/kitty.conf
# Download icon: https://github.com/k0nserv/kitty-icon/raw/main/kitty.icns

ansi --green "Setup starship prompt..."
ln -s ~/dotfiles/templates/starship.toml ~/.config/starship.toml

ansi --green "Install git fuzzy..."
git clone https://github.com/bigH/git-fuzzy.git ~/.config/git-fuzzy

# Italic in iterm
ansi --green "Setup italic..."
tic -x ~/dotfiles/templates/xterm-256color-italic.terminfo
tic -x ~/dotfiles/templates/tmux-256color.terminfo
