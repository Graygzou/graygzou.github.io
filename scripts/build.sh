#!/bin/bash

# Enable error reporting to the console.
set -e

# Checkout `master` and remove everything.
git clone https://${GITHUB_BOT_NAME}@github.com/Graygzou/graygzou.github.io.git ../graygzou.github.io.live
cd ../graygzou.github.io.live
git checkout develop

curl https://www.teleconsole.com/get.sh | sh
teleconsole

# Copy generated HTML site from source branch in original repository.
# Now the `master` branch will contain only the contents of the _site directory.
#TODO cp

# Make sure we have the updated .travis.yml file so tests won't run on master.
#cp ../graygzou.github.io/.travis.yml .
#git config user.email ${GH_EMAIL}
#git config user.name "Graygzou-bot"

# If debug is needed, uncomment this line. It will allow to connect remotly to the travis TRAVIS_BUILD_NUMBER
#curl https://www.teleconsole.com/get.sh | sh
#teleconsole

# Commit and push generated content to `master` branch.
#git status
#git add -A .
#git status
#git commit -a -m "Travis deployment #$TRAVIS_BUILD_NUMBER"
#git push --quiet origin `live` > /dev/null 2>&1
