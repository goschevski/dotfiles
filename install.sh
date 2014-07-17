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
FILES="vimrc zshrc aliases osx vim"

# loop through old files and delete them
for file in $FILES
do
    rm -rf $home_dir/.$file
done

coloredEcho "1. Finished deleting of $FILES (old dotfiles)" green

# loop through files and link them
for file in $FILES
do
    ln -s $dotfiles_dir/$file $home_dir/.$file
done

coloredEcho "2. Finished linking of $FILES (new dotfiles)" green

# Remove and link sublime folder
rm -rf "$sublime_dir/User"
ln -s "$dotfiles_dir/User" "$sublime_dir/User"
coloredEcho "3. Linked sublime settings" green

coloredEcho "4. Cloning vundle package manager for vim" green
git clone https://github.com/gmarik/vundle.git ~/dotfiles/vim/bundle/vundle

# Install doctorjs (jsctags)
coloredEcho "5. Clone and install doctorjs (jsctags)" green
git clone https://github.com/mozilla/doctorjs ~/doctorjs
cd ~/doctorjs && git submodule init && git submodule update && sudo make install

echo "To update files, just pull changes." cyan
