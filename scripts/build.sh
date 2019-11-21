#!/bin/bash

# Enable error reporting to the console.
set -e

# Checkout `master` and remove everything.
# This works because the API key can replace your password.
# see https://stackoverflow.com/questions/23277391/how-to-publish-to-github-pages-from-travis-ci/33125422#33125422
git clone https://${GITHUB_BOT_NAME}:${BOT_DEPLOY_TOKEN}@github.com/Graygzou/graygzou.github.io.git ../graygzou.github.io.develop
cd ../graygzou.github.io.develop
git checkout develop

#curl https://www.teleconsole.com/get.sh | sh
#teleconsole

# Copy generated HTML site from source branch in original repository.
# Now the `master` branch will contain only the contents of the _site directory.
cp ../graygzou.github.io/scripts/grammarBotResults.txt ./scripts/

# Make sure we have the updated .travis.yml file so tests won't run on master.
#cp ../graygzou.github.io/.travis.yml .
git config user.email ${GITHUB_BOT_MAIL}
git config user.name ${GITHUB_BOT_NAME}

# If debug is needed, uncomment this line. It will allow to connect remotly to the travis TRAVIS_BUILD_NUMBER
#curl https://www.teleconsole.com/get.sh | sh
#teleconsole

# Commit and push generated content to `master` branch.
git status
git add scripts/grammarBotResults.txt
git status
# This will avoid to build everytime the bot upload results (since we should trust what it does..)
git commit -a -m "[skip travis][ignore] Upload grammarbot results to develop for build #$TRAVIS_BUILD_NUMBER"
git push
