#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# Script that run pngquant.
#############################################################################

# The -e flag causes the script to exit as soon as one command returns a non-zero exit code
# The -v flag makes the shell print all lines in the script before executing them, which helps identify which steps failed.
set -ev

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

# If debug is needed, uncomment this line.
# It will allow to connect remotly to the travis TRAVIS_BUILD_NUMBER
#curl https://www.teleconsole.com/get.sh | sh
#teleconsole
echo "travis_fold:end:run_pngquant"

echo "pngquant-compression.sh script done."
