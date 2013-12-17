#! /bin/bash

home_dir=/Users/aleksandargosevski
dotfiles_dir=$home_dir/dotfiles

#loop through files and link them
for file in vimrc zshrc aliases osx vim
do
    echo "Removing $file."
    rm -rf $dotfiles_dir/$file $home_dir/.$file
    echo "Linking $file."
    ln -s $dotfiles_dir/$file $home_dir/.$file
done

echo "Finished linking. To update files, just pull changes."