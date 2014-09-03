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

# Variables
home_dir=/Users/aleksandargosevski
dotfiles_dir=$home_dir/dotfiles
sublime_dir="$home_dir/Library/Application Support/Sublime Text 3/Packages/"
FILES="vimrc zshrc aliases osx vim slate jshintrc"

# Install oh-my-zsh
coloredEcho "1. Installing oh-my-zsh" green
rm -rf ~/.oh-my-zsh
git clone git://github.com/robbyrussell/oh-my-zsh.git ~/.oh-my-zsh --quiet
chsh -s /bin/zsh

# Install zsh-autosuggestions
coloredEcho "2. Installing zsh autosuggestions" green
rm -rf ~/.zsh-autosuggestions
git clone git://github.com/tarruda/zsh-autosuggestions ~/.zsh-autosuggestions --quiet

# Set goschevski zsh theme
coloredEcho "3. Set up goscheveski zsh theme" green
mkdir ~/.oh-my-zsh/custom/themes/
ln -s $dotfiles_dir/goschevski.zsh-theme ~/.oh-my-zsh/custom/themes/goschevski.zsh-theme

# Loop through old files and delete them
coloredEcho "4. Deleting $FILES (old dotfiles)" green
for file in $FILES
do
    rm -rf $home_dir/.$file
done

# Loop through files and link them
coloredEcho "5. Linking $FILES (new dotfiles)" green
for file in $FILES
do
    ln -s $dotfiles_dir/$file $home_dir/.$file
done

# Remove and link sublime folder
coloredEcho "6. Linking sublime settings" green
rm -rf "$sublime_dir/User"
ln -s "$dotfiles_dir/User" "$sublime_dir/User"

coloredEcho "7. Cloning vundle package manager for vim" green
rm -rf ~/dotfiles/vim/bundle/*
git clone https://github.com/gmarik/vundle.git ~/dotfiles/vim/bundle/vundle --quiet

# Install doctorjs (jsctags)
coloredEcho "8. Installing doctorjs (jsctags)" green
rm -rf ~/doctorjs
git clone https://github.com/mozilla/doctorjs ~/doctorjs --quiet
cd ~/doctorjs && git submodule init --quiet && git submodule update --quiet && (sudo make install) 2>&1 > /dev/null
sudo ed /usr/local/lib/jsctags/ctags/index.js << END
51i
tags: [],
.
w
q
END

coloredEcho "To update files, just pull changes." cyan
