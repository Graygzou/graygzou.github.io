#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# Upload new file to github if necessary
#############################################################################

echo "$#"

# Parameters check
if [ "$#" -eq 0 ]; then
  echo "you need to provide a pattern to find files to log for."
  exit
fi

branch='develop'
# change branch if necessary
echo "travis_fold:start:checkout_branch"
echo "Change branch if necessary"
if [ "$#" -gt 1 ]; then 
  echo "Change branch from $branch to $2"
  branch=$2
  git checkout $branch
else
  echo "Stay on branch $branch"
fi
echo "travis_fold:end:checkout_branch"

# upload to github if necessary
echo "travis_fold:start:config_user"
echo "Change branch if necessary"
git config user.email ${GITHUB_BOT_MAIL}
git config user.name ${GITHUB_BOT_NAME}
echo "travis_fold:end:config_user"

# Loop over all patterns to add provided in arguments
for pattern in "$@"
do
  # Check to avoid extra commit if not necessary 
  echo "travis_fold:start:upload_to_github"
  echo "Upload files to the ${TRAVIS_BRANCH} branch"

  # Use grep instead of basic add !
  git add $(git log --name-only -n 1 HEAD~1..HEAD --pretty=format:%b | grep $pattern)
done
git status

# Debug
curl https://www.teleconsole.com/get.sh | sh
teleconsole

NB_FILE_CHANGED="$(git status --porcelain | grep ^[AM] | wc -l)"

if [ "${NB_FILE_CHANGED}" -gt 0 ]; then 
    git commit -m "[skip travis][ignore] Upload files generate by the job #$TRAVIS_JOB_NUMBER $TRAVIS_JOB_NAME : $TRAVIS_JOB_WEB_URL"
    git push origin HEAD:$branch
else
    echo "Nothing to commit, working tree clean. Skip the commit/push commands."
fi
echo "travis_fold:end:upload_to_github"
echo "Upload files to GitHub done."
