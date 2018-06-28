#!/bin/bash

MASTER_BRANCH="master"
GH_PAGES_BRANCH="gh-pages"
TARGET_REPO="stevinson/tech-notes"

#if [ "$TRAVIS_BRANCH" != "master" ]
#then
#  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
#  exit 0
#fi

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    echo -e "Starting to deploy to Github Pages\n"
    if [ "$TRAVIS" == "true" ]; then
        git config --global user.email "edward.stevinson@hotmail.com"
        git config --global user.name "Stevinson"
    fi
    # clone gh-pages branch
    git clone --quiet --branch=${MASTER_BRANCH} https://${GH_TOKEN}@github.com/$TARGET_REPO built_gitbook
    # copy data we are interested in
    cd built_gitbook
    echo -e "2"
    git checkout gh-pages
    echo -e "3"
    gitbook build book ./_book
    echo -e "4"
    cp -R _book/* .
    echo -e "5"
    git clean -fx node_modules
    git clean -fx _book
    echo -e "6"
    git add .
    echo -e "7"
    git commit -m "Travis build pushed to gh-pages" # add $TRAVIS_BUILD_NUMBER
    echo -e "8"
    git push -fq origin $GH_PAGES_BRANCH 
    echo -e "Deploy completed\n"
fi

