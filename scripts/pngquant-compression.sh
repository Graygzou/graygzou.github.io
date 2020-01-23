#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# Script that run pngquant.
#############################################################################

# Try to find if any file matching the provided extension
pngResult=$( ./scripts/file-changed-in-last-commit.sh "*.png" )

echo "$pngResult"

if [[ "$pngResult" -ne 0 ]] ; then
    # Install the package
    echo "travis_fold:start:install_pngquant"
    echo "install pngquant for png compression"
    sudo apt-get install pngquant
    echo "travis_fold:end:install_pngquant"

    # Run the package
    echo "travis_fold:start:run_pngquant"
    echo "Run pngquant command"
    # This will create duplicate of images with -fs8 at the end of the file
    find ./jekyll/site/assets/project-images/ -name "*.png" -exec pngquant --force {} \;

    # Remove the previous image not optimized
    echo "Remove the previous image not optimized"
    find ./jekyll/site/assets/project-images/ -name "*.png" -not -name "*fs8.png" -exec rm {} \;

    # Rename the file generate to match previous version
    echo "Rename compressed images to match declarations"
    find ./jekyll/site/assets/project-images/ -name "*.png" -exec rename "s/-fs8//g" {} \;
    echo "travis_fold:end:run_pngquant"

    # Upload artifacts to the repo
    echo "travis_fold:start:push_results"
    echo "push compressed png images to the branch"
    ./scripts/upload-new-file.sh "*.png"
    echo "travis_fold:end:push_results"
else
  echo "⏭️ No png in the last commit. Job skipped."
fi
echo "✅ pngquant-compression.sh script done."