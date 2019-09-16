#!/bin/bash

# Enable error reporting to the console.
set -e

# Checkout `master` and remove everything.
#git clone https://${GH_TOKEN}@github.com/Graygzou/graygzou.github.io.git ../graygzou.github.io.master
#cd ../graygzou.github.io.master
#git checkout master
#rm -rf *

# Copy generated HTML site from source branch in original repository.
# Now the `master` branch will contain only the contents of the _site directory.
#cp -R ../graygzou.github.io/_site/* .

# Make sure we have the updated .travis.yml file so tests won't run on master.
#cp ../savaslabs.github.io/.travis.yml .
#git config user.email ${GH_EMAIL}
#git config user.name "savas-bot"

# Commit and push generated content to `master` branch.
#git status
#git add -A .
#git status
#git commit -a -m "Travis #$TRAVIS_BUILD_NUMBER"
#git push --quiet origin `master` > /dev/null 2>&1
