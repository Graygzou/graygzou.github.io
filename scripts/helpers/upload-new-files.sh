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

extension=$1

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
    # need to retrieve only the filename without the extension cause it's a webp image
    echo "[DEBUG] Add file $filenameCommittedEscape.$extension"
    git add "*$filenameCommittedEscape.$extension"
  fi
done
git status
echo "travis_fold:end:add_files"
