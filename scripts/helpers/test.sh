#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# test script for experimenting
#############################################################################

echo "Add new files based on the previous commit"
gitLog=$(git log --name-only -n 1 42b47af89 --pretty=format:%b)
echo $gitLog
for fileCommitted in $(echo $gitLog | tr -d "\n")
do
  fileCommittedEscape=$(echo "$fileCommitted" | sed -r 's/\[/\\[/g' | sed -r 's/\]/\\]/g')
  fileFound=$(git status --porcelain | grep $fileCommittedEscape)
  echo "Result of gre p on git status $fileFound"
  if [ -n "$fileFound" ]; then 
    echo "Add file $fileCommitted"
    git add "$fileCommitted"
  fi
done