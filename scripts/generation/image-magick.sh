#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# Run ImageMagick algorithm to create different versions of all images
#############################################################################

# Parameters check
echo "$#"
if [ "$#" -eq 0 ]; then
  echo "you need to provide a file extension to run algorithm on it."
  exit
fi

# Run ImageMagick algorithm
echo "travis_fold:start:imageMagick"
echo "Start running imageMagick"
extension=$1
# Test 1
git status
find jekyll/assets/ -regex ".*/*\[[0-9]+x[0-9]+\]\.$extension" -exec identify {} \;
# Apply the command
find jekyll/assets/ -regex ".*/*\[[0-9]+x[0-9]+\]\.$extension" -exec bash -c 'convert {} -resize $(echo {} | tr -cd "0-9x") {}' \;
# Test 2
git status
find jekyll/assets/ -regex ".*/*\[[0-9]+x[0-9]+\]\.$extension" -exec identify {} \;
echo "travis_fold:end:imageMagick"

# Upload back to github the artifacts created
echo "travis_fold:start:push_resize"
echo "push new resized images to the branch"
./scripts/helpers/upload-new-file.sh "jekyll/assets/*\[*x*\]\.$extension"
echo "travis_fold:end:push_resize"
