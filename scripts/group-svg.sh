#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# Build
#############################################################################

# The -e flag causes the script to exit as soon as one command returns a non-zero exit code
# The -v flag makes the shell print all lines in the script before executing them, which helps identify which steps failed.
set -ev

git log --name-only -n 1 HEAD~1..HEAD --pretty=format:%b > last-commit.txt

echo $1
echo $2

# Try to find if any file matching the provided extension
result=$( ./scripts/file-changed-in-last-commit.sh $1 )

echo "$result"

if [ "$result" = 0 ]; then
    echo 'No file changed with the extension' . $1 . '. Nothing to do.'
    exit
else
    python ./scripts/mainSvgGen.py
fi