#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# Grammar-bot
#############################################################################

pip install -r requirements.txt

# Run python script
(cd scripts && python grammarContentCheck.py ${GRAMMAR_BOT_TOKEN} \;)

# Checkout `master` and remove everything.
# This works because the API key can replace your password.
# see https://stackoverflow.com/questions/23277391/how-to-publish-to-github-pages-from-travis-ci/33125422#33125422
echo "travis_fold:start:upload_grammar_bot"
echo "Upload Grammarbot txt result file to the develop branch"
git clone https://${GITHUB_BOT_NAME}:${BOT_DEPLOY_TOKEN}@github.com/Graygzou/graygzou.github.io.git ../graygzou.github.io.develop
cd ../graygzou.github.io.develop
git checkout develop

# Copy generated HTML site from source branch in original repository.
# Now the `master` branch will contain only the contents of the _site directory.
cp ../graygzou.github.io/scripts/grammarBotResults.txt ./scripts/

# Make sure we have the updated .travis.yml file so tests won't run on master.
git config user.email ${GITHUB_BOT_MAIL}
git config user.name ${GITHUB_BOT_NAME}

# Commit and push generated content to `master` branch.
git add scripts/grammarBotResults.txt

# This will avoid to build everytime the bot upload results (since we should trust what it does..)
NB_FILE_CHANGED="$(git status --porcelain | grep ^[AM] | wc -l)"

if [ "${NB_FILE_CHANGED}" -gt 0 ]; then
    git commit -a -m "[skip travis][ignore] Upload grammarbot results to develop for build #$TRAVIS_BUILD_NUMBER"
    git push
else
    echo "Nothing to commit, working tree clean. Skip the commit/push commands."
fi

echo "travis_fold:end:upload_grammar_bot"
echo "Upload grammarbot results done."