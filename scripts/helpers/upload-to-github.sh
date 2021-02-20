#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# Upload new file to github if necessary
#
# Parameters:
#     1. files types uploaded (0 = for new files, 1 = for files changed)
#     2. pattern to look for during the git add.
#     3. the branch to checkout (optional)
#############################################################################

echo "$#"

# Parameters check
if [ "$#" -lt 1 ]; then
  echo "you need to provide a pattern to find files to log for."
  exit
fi

type=$1
pattern=$2

branch=travis-build-${TRAVIS_BUILD_NUMBER}
echo "travis_fold:start:checkout_build_branch"
echo "Change branch to the build one in order to not pollute the others"
echo "Change branch from $branch to travis-build-${TRAVIS_BUILD_NUMBER}"
git checkout $branch
echo "travis_fold:end:checkout_branch"

echo "travis_fold:start:config_user"
echo "Config github bot user"
git config user.email ${GITHUB_BOT_MAIL}
git config user.name ${GITHUB_BOT_NAME}
echo "travis_fold:end:config_user"

echo "travis_fold:start:git_add_script"
echo "Run the script in charge of adding content"
#if [ "$1" -eq 1 ]; then 
  echo "Launch upload new files script"
  ./scripts/helpers/upload-new-files.sh $pattern
#else
#  echo "Launch upload changed files script"
#  ./scripts/helpers/upload-changed-files.sh $pattern
#fi
echo "travis_fold:end:git_add_script"

# Check to avoid extra commit if not necessary 
echo "travis_fold:start:upload_to_github"
echo "Upload files to the ${TRAVIS_BRANCH} branch"
NB_FILE_CHANGED="$(git status --porcelain | grep ^[AMRD] | wc -l)"
if [ "${NB_FILE_CHANGED}" -gt 0 ]; then 
    git commit -m "[skip travis][ignore] Upload files generate by the job #$TRAVIS_JOB_NUMBER $TRAVIS_JOB_NAME : $TRAVIS_JOB_WEB_URL"
    git push origin HEAD:$branch
else
    echo "Nothing to commit, working tree clean. Skip the commit/push commands."
fi
echo "travis_fold:end:upload_to_github"
echo "Upload files to GitHub done."
