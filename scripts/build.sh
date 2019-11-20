#!/bin/bash

# Enable error reporting to the console.
set -e

# Checkout `master` and remove everything.
git clone https://${GITHUB_BOT_NAME}@github.com/Graygzou/graygzou.github.io.git ../graygzou.github.io.develop
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
git commit -a -m "Upload grammarbot results to develop for build #$TRAVIS_BUILD_NUMBER"
git push --quiet origin `master` > /dev/null 2>&1
