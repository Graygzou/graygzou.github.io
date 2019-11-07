#!/bin/bash

# Enable error reporting to the console.
set -e

#curl https://www.teleconsole.com/get.sh | sh
#teleconsole

# ====================
# PNG COMPRESSION
# ====================
# This will create duplicate of images with -fs8 at the end of the file
echo "Run pngquant command"
find jekyll/site/assets/project-images/ -name "*.png" -exec pngquant --force {} \;
# Remove the previous image not optimized
echo "Remove the previous image not optimized"
find jekyll/site/assets/project-images/ -not -name "*fs8.png" -exec rm {} \;
# Rename the file generate to match previous version
echo "Rename compressed images to match declarations"
rename "s/fs8//g" jekyll/site/assets/project-images/*.png

# If debug is needed, uncomment this line.
# It will allow to connect remotly to the travis TRAVIS_BUILD_NUMBER
curl https://www.teleconsole.com/get.sh | sh
teleconsole

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
# Must first enter jekyll folder to access the Gemfile.
cd jekyll
bundle exec htmlproofer site --url-ignore "https://www.linkedin.com/in/gregoire-boiron/,https://www.latecoere.aero/en/"
