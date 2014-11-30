echo "\033[0;34mCloning dotfiles...\033[0m"
git clone git@github.com:goschevski/dotfiles.git ~/dotfiles --quiet
chmod +x ~/dotfiles/scripts/brew.sh
chmod +x ~/dotfiles/scripts/terminal.sh
~/dotfiles/scripts/brew.sh
~/dotfiles/scripts/terminal.sh
