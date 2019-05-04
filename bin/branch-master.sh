#!/bin/sh

git reset --hard
git co master;git pull

git co -b chinomng/$1


