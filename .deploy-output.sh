#!/bin/bash
set -ev
STATUS=`git log -1 --pretty=oneline`

cp single-page.html ./out/
mkdir ./out/fonts
mkdir ./out/images
mkdir ./out/styles
cp fonts/* ./out/fonts
cp images/* ./out/images
cp styles/* ./out/styles
cp entities.dtd ./out/
cp entities.json ./out/

cd out
git init
git config user.name "Travis-CI"
git config user.email "travis-ci"
ls
git add .
git commit -m "Built by Travis-CI: $STATUS"
git status

GH_REPO="@github.com/fititnt/html51-translation-testing-hello-world.git"
FULL_REPO="https://$GH_TOKEN$GH_REPO"
#git push --force --quiet $FULL_REPO html5.1-translation-pt:gh-pages > /dev/null 2>&1
git push --force --quiet $FULL_REPO html5.1-translation-pt:gh-pages

