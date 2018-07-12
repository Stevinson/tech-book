#!/bin/bash

MASTER_BRANCH="master"
GH_PAGES_BRANCH="gh-pages"
TARGET_REPO="stevinson/tech-book"

#if [ "$TRAVIS_BRANCH" != "master" ]
#then
#  echo "This commit was made against the $TRAVIS_BRANCH and not the master! No deploy!"
#  exit 0
#fi

if [ "$TRAVIS_PULL_REQUEST" == "false" ]; then
    echo -e "Starting to deploy to Github Pages\n"
    if [ "$TRAVIS" == "true" ]; then
        echo -e "This is a Travis build"
        git config --global user.email "edward.stevinson@hotmail.com"
        git config --global user.name "Stevinson"
    fi
    # clone gh-pages branch
    git clone --quiet --branch=${MASTER_BRANCH} https://${GH_TOKEN}@github.com/$TARGET_REPO built_gitbook > /dev/null
    # copy data we are interested in
    cd built_gitbook
    git checkout gh-pages
    gitbook build book ./_book
    cp -R _book/* .
    git clean -fx node_modules
    git clean -fx _book
    git add .
    git commit -m "Travis build $TRAVIS_BUILD_NUMBER pushed to gh-pages" # add $TRAVIS_BUILD_NUMBER
    echo -e "Pushing to $GH_PAGES_BRANCH"
    git config --list
    echo '-----------------------------------'
    git config credential.helper "store --file=.git/credentials" # Look for the credentials
    echo "https://${GH_TOKEN}:@github.com" > .git/credentials # Add the token to the credentials file
    # node ./node_modules/grunt-cli/bin/grunt release # ?
    echo '-----------------------------------'
    git remote -v
    git push -fq origin $GH_PAGES_BRANCH > /dev/null
    echo -e "Deploy completed\n"
fi

