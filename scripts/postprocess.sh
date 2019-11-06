#!/bin/bash

# Enable error reporting to the console.
set -e

# ====================
# PNG COMPRESSION
# ====================
# This will create duplicate of images with -fs8 at the end of the file
echo "Run pngquant command"
find ./jekyll/assets/project-images/ -name "*.png" -exec pngquant --force {} \;
# Remove the previous image not optimized
echo "Remove the previous image not optimized"
find ./jekyll/assets/project-images/ -not -name "*fs8.png" -exec rm {} \;
# Rename the file generate to match previous version
echo "Rename compressed images to match declarations"
rename "s/fs8//g" ./jekyll/assets/project-images/*.png

# If debug is needed, uncomment this line.
# It will allow to connect remotly to the travis TRAVIS_BUILD_NUMBER
# curl https://www.teleconsole.com/get.sh | sh
# teleconsole

# ====================
# JPG COMPRESSION
# ====================
# For all the jpg in the project run Guetzli.
# See https://github.com/google/guetzli for more info
# Run the exe for each jpg found
#find -depth -name "*.jpg" -exec guetzli --verbose {} {}


# ====================
# HTML PROOFER
# ====================
# Check that everything is ok with htmlproofer
# Must be execute in the travis.yml because it's easier to access the Gemfile.
