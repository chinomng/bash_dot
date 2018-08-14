#!/bin/sh

branch_name=`git status | grep 'On branch' | sed -r 's/^On branch //'`

echo $branch_name

git push -u origin $branch_name

