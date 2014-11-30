#! /bin/bash

# -----------------------------------------
# Install oh-my-zsh
# -----------------------------------------
echo "\033[0;34mInstalling oh-my-zsh...\033[0m"
rm -rf ~/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh --quiet
chsh -s /bin/zsh

# -----------------------------------------
# Install zsh-autosuggestions
# -----------------------------------------
echo "\033[0;34mInstalling zsh-autosuggestions...\033[0m"
rm -rf ~/.zsh-autosuggestions
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions --quiet

# -----------------------------------------
# Set goschevski zsh theme
# -----------------------------------------
echo "\033[0;34mSetup goschevski zsh theme...\033[0m"
mkdir ~/.oh-my-zsh/custom/themes/
ln -s ~/dotfiles/goschevski.zsh-theme ~/.oh-my-zsh/custom/themes/goschevski.zsh-theme

# -----------------------------------------
# Symlink homefiles
# -----------------------------------------
echo "\033[0;34mSetup homefiles...\033[0m"
for file in $(ls ~/dotfiles/homefiles/)
do
    rm -rf ~/.$file
    ln -s ~/dotfiles/homefiles/$file ~/.$file
done

# -----------------------------------------
# Install vundle
# -----------------------------------------
echo "\033[0;34mCloning vundle...\033[0m"
rm -rf ~/dotfiles/vim/bundle/*
git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim --quiet
