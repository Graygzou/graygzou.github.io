#!/bin/bash

# Enable error reporting to the console.
set -e

#curl https://www.teleconsole.com/get.sh | sh
#teleconsole

# ========================================
# PNG COMPRESSION WITH PNGQUANT
# ========================================
# This will create duplicate of images with -fs8 at the end of the file
echo "Run pngquant command"
find jekyll/site/assets/project-images/ -name "*.png" -exec pngquant --force {} \;

# Remove the previous image not optimized
echo "Remove the previous image not optimized"
find jekyll/site/assets/project-images/ -name "*.png" -not -name "*fs8.png" -exec rm {} \;

# Rename the file generate to match previous version
echo "Rename compressed images to match declarations"
find jekyll/site/assets/project-images/ -name "*.png" -exec rename "s/-fs8//g" {} \;

# If debug is needed, uncomment this line.
# It will allow to connect remotly to the travis TRAVIS_BUILD_NUMBER
curl https://www.teleconsole.com/get.sh | sh
teleconsole

# ========================================
# JPG COMPRESSION WITH GUETZLI
# ========================================
# For all the jpg in the project run Guetzli.
# See https://github.com/google/guetzli for more info
find jekyll/site/assets/ -name "*.jpg" -exec guetzli/bin/Release/guetzli --verbose {} {} \;

# ====================
# HTML PROOFER
# ====================
# Check that everything is ok with htmlproofer
# Must first enter jekyll folder to access the Gemfile.
cd jekyll
bundle exec htmlproofer site --url-ignore "https://www.linkedin.com/in/gregoire-boiron/,https://www.latecoere.aero/en/"
