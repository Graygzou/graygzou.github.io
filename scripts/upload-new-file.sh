#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# Upload new file to github if necessary
#############################################################################

# Parameters check
if [ "$?" -eq 0 ]; then
  echo "you need to provide a pattern to find files to log for."
  exit
fi

# Retrieve the pattern provided by the user
pattern=$1

echo "travis_fold:start:upload_to_github"
echo "Upload files to the ${TRAVIS_BRANCH} branch"
# upload to github if necessary
git config user.email ${GITHUB_BOT_MAIL}
git config user.name ${GITHUB_BOT_NAME}
git add $pattern

# Check to avoid extra commit if not necessary   
NB_FILE_CHANGED="$(git status --porcelain | grep ^[AM] | wc -l)"
if [ "${NB_FILE_CHANGED}" -gt 0 ]; then
    git commit -a -m "[skip travis][ignore] Upload files generate by the job #$TRAVIS_JOB_NUMBER $TRAVIS_JOB_NAME : $TRAVIS_JOB_WEB_URL"
    git push
else
    echo "Nothing to commit, working tree clean. Skip the commit/push commands."
fi
echo "travis_fold:end:upload_to_github"
echo "Upload files to GitHub done."
