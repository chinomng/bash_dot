#!/bin/sh

git reset --hard
git co staging;git pull

git co -b chinomng/$1


