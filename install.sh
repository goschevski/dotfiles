#! /bin/bash

home_dir=/Users/aleksandargosevski
dotfiles_dir=$home_dir/dotfiles

# loop through old files and delete them
for file in vimrc zshrc aliases osx vim
do
     echo "Removing old $file."
    rm -rf $dotfiles_dir/$file $home_dir/.$file
done

echo "Finished deleting."

# loop through files and link them
for file in vimrc zshrc aliases osx vim
do
    echo "Linking $file."
    ln -s $dotfiles_dir/$file $home_dir/.$file
done

echo "Finished linking. To update files, just pull changes."