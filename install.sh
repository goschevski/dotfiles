#! /bin/bash

home_dir=/Users/aleksandargosevski
dotfiles_dir=$home_dir/dotfiles
sublime_dir="$home_dir/Library/Application Support/Sublime Text 3/Packages/"

FILES="vimrc zshrc aliases osx vim"

echo "Cloning vundle package manager for vim"
git clone https://github.com/gmarik/vundle.git ~/dotfiles/vim/bundle/vundle

# loop through old files and delete them
for file in $FILES
do
    rm -rf $home_dir/.$file
done

echo "Finished deleting of $FILES"

# loop through files and link them
for file in $FILES
do
    ln -s $dotfiles_dir/$file $home_dir/.$file
done

echo "Finished linking of $FILES"

# Remove and link sublime folder
rm -rf "$sublime_dir/User"
ln -s "$dotfiles_dir/User" "$sublime_dir/User"
echo "Linked sublime settings"

# Install doctorjs (jsctags)
echo "Clone and install doctorjs (jsctags)"
git clone https://github.com/mozilla/doctorjs ~/doctorjs
cd ~/doctorjs && git submodule init && git submodule update && sudo make install

echo "To update files, just pull changes."
