#!/bin/bash

shopt -s dotglob # shows dots in file globbing

for i in .bashrc .zshrc .shell .config/i3 .config/i3status .config/terminator .gitconfig .inputrc .pythonrc.py
do
  rm $HOME/$i 2>/dev/null # remove duplicates
  ln -s `pwd`/$i $HOME/$i # copy new files in
done

echo "Symlinking successful."
