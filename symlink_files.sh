#!/bin/bash

shopt -s dotglob # shows dots in file globbing

for i in .bashrc .shell .config/i3 .gitconfig .gitignore mozio/.isort.cfg .inputrc .pythonrc.py
do
  rm $HOME/$i 2>/dev/null # remove duplicates
  ln -s `pwd`/$i $HOME/$i # copy new files in
done

#for i in *; do
  #rm $HOME/$i 2>/dev/null # remove duplicates
  
  #if [( $i == *~ ) | ( $i == README.md ) | ($i == scripts) ] 
  #then
  #    echo "Excluding $i"
  #else
  #    ln -s `pwd`/$i $HOME/$i # copy new files in
  #fi
#done

# Clean up after our naieve loop
#rm $HOME/symlink_files.sh
#rm $HOME/crontab
#rm -rf $HOME/.git

#mkdir $HOME/.virtualenvs
#mkdir $HOME/.pip
#mkdir $HOME/.pip/packages

echo "Symlinking successful."
