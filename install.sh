#! /bin/bash

# Helper function to color the output
function coloredEcho(){
    local exp=$1;
    local color=$2;
    if ! [[ $color =~ '^[0-9]$'  ]] ; then
        case $(echo $color | tr '[:upper:]' '[:lower:]') in
            black) color=0 ;;
            red) color=1 ;;
            green) color=2 ;;
            yellow) color=3 ;;
            blue) color=4 ;;
            magenta) color=5 ;;
            cyan) color=6 ;;
            white|*) color=7 ;; # white or invalid color
        esac
    fi
    tput setaf $color;
    echo $exp;
    tput sgr0;
}

# -----------------------------------------
# Install oh-my-zsh
# -----------------------------------------
function ohmyzsh () {
    coloredEcho "1. Installing oh-my-zsh" green
    rm -rf ~/.oh-my-zsh
    git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh --quiet
    chsh -s /bin/zsh
}

# -----------------------------------------
# Install zsh-autosuggestions
# -----------------------------------------
function zshsuggestions () {
    coloredEcho "2. Installing zsh autosuggestions" green
    rm -rf ~/.zsh-autosuggestions
    git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions --quiet
}

# -----------------------------------------
# Set goschevski zsh theme
# -----------------------------------------
function zshtheme () {
    coloredEcho "3. Set up goscheveski zsh theme" green
    mkdir ~/.oh-my-zsh/custom/themes/
    ln -s ~/dotfiles/goschevski.zsh-theme ~/.oh-my-zsh/custom/themes/goschevski.zsh-theme
}

# -----------------------------------------
# Symlink homefiles
# -----------------------------------------
function homefiles () {
    coloredEcho "4. Deleting homefiles (old)" green
    for file in $(ls ~/dotfiles/homefiles/)
    do
        rm -rf ~/.$file
        ln -s ~/dotfiles/homefiles/$file ~/.$file
    done
}

# -----------------------------------------
# Remove and link sublime folder
# -----------------------------------------
function sublime () {
    coloredEcho "6. Linking sublime settings" green
    rm -rf "~/Library/Application Support/Sublime Text 3/Packages/User"
    ln -s ~/dotfiles/User ~/Library/Application Support/Sublime Text 3/Packages/User/User
}

# -----------------------------------------
# Install vundle
# -----------------------------------------
function vundle () {
    coloredEcho "7. Cloning vundle package manager for vim" green
    rm -rf ~/dotfiles/vim/bundle/*
    git clone https://github.com/gmarik/Vundle.vim.git ~/.vim/bundle/Vundle.vim --quiet
}
