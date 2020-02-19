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

# Change branch if necessary
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

extension=$1

# Upload to github if necessary
echo "travis_fold:start:config_user"
echo "Config github bot user"
git config user.email ${GITHUB_BOT_MAIL}
git config user.name ${GITHUB_BOT_NAME}
echo "travis_fold:end:config_user"

# Loop over all files changed during the last commit to add them if needed
echo "travis_fold:start:add_files"
echo "Add new files based on the previous commit"
gitLog=$(git log --name-only -n 1 HEAD~1..HEAD --pretty=format:%b)
echo "[DEBUG] recap of the last commit = $gitLog"
for fileCommitted in $(echo $gitLog | tr -d "\n")
do
  echo "[DEBUG] file committed in the previous $fileCommitted"
  filenameExtCommitted=$(basename -- "$fileCommitted")
  filenameCommitted="${filenameExtCommitted%.*}"
  filenameCommittedEscape=$(echo "$filenameCommitted" | sed -r 's/\[/\\[/g' | sed -r 's/\]/\\]/g')
  echo "[DEBUG] file to found in git status --porcelain = $filenameCommittedEscape"
  fileFound=$(git status --porcelain | grep $filenameCommittedEscape)
  echo "[DEBUG] Result of grep on git status = $fileFound"
  if [ -n "$fileFound" ]; then
    # need to retrieve only the filaname without the extension cause it's a webp image
    echo "[DEBUG] Add file $filenameCommitted.$extension"
    git add "$filenameCommitted.$extension"
  fi
done
git status
echo "travis_fold:end:add_files"

# Check to avoid extra commit if not necessary 
echo "travis_fold:start:upload_to_github"
echo "Upload files to the ${TRAVIS_BRANCH} branch"
NB_FILE_CHANGED="$(git status --porcelain | grep ^[AM] | wc -l)"
if [ "${NB_FILE_CHANGED}" -gt 0 ]; then 
    git commit -m "[skip travis][ignore] Upload files generate by the job #$TRAVIS_JOB_NUMBER $TRAVIS_JOB_NAME : $TRAVIS_JOB_WEB_URL"
    git push origin HEAD:$branch
else
    echo "Nothing to commit, working tree clean. Skip the commit/push commands."
fi
echo "travis_fold:end:upload_to_github"
echo "Upload files to GitHub done."
