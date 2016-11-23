git checkout master
git pull

git checkout $1
git pull origin $1
git merge master

sed -i -E "s/version='.+'/version='$2'/" ${PWD}/setup.py
git add ${PWD}/setup.py
git commit -m "Update version on setup.py"
git push

git checkout master
git merge $1
git push

git tag $2
git push --tags
