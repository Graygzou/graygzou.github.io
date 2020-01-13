#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#############################################################################

#========================================
# PNG COMPRESSION WITH PNGQUANT
#========================================
echo "travis_fold:start:run_pngquant"
echo "Run pngquant command"
# This will create duplicate of images with -fs8 at the end of the file
find jekyll/site/assets/project-images/ -name "*.png" -exec pngquant --force {} \;

# Remove the previous image not optimized
echo "Remove the previous image not optimized"
find jekyll/site/assets/project-images/ -name "*.png" -not -name "*fs8.png" -exec rm {} \;

# Rename the file generate to match previous version
echo "Rename compressed images to match declarations"
find jekyll/site/assets/project-images/ -name "*.png" -exec rename "s/-fs8//g" {} \;

# If debug is needed, uncomment this line.
# It will allow to connect remotly to the travis TRAVIS_BUILD_NUMBER
#curl https://www.teleconsole.com/get.sh | sh
#teleconsole
echo "travis_fold:end:run_pngquant"

#========================================
# JPG COMPRESSION WITH GUETZLI
#========================================
echo "travis_fold:start:run_guetzli"
echo "Start run guetzli for jpg compression"
# For all the jpg in the project run Guetzli.
# See https://github.com/google/guetzli for more info
find jekyll/site/assets/ -name "*.jpg" -exec guetzli-1.0.1/bin/Release/guetzli --verbose {} {} \;
echo "travis_fold:end:run_guetzli"

#========================================
# JPG encoding to WebP WITH cwebp
#========================================
echo "travis_fold:start:run_cwebp"
echo "Start run guetzli for jpg compression"
# Use cwebp to encode all asset images. see https://developers.google.com/speed/webp/docs/precompiled
find jekyll/site/assets/ \( -name "*.jpg" -o -name "*.png" \) -exec cwebp {} -o {}.webp \;
find jekyll/site/assets/ -name "*.webp" -exec rename "s/\.png|\.jpg//g" {} \;
echo "travis_fold:end:run_cwebp"

#====================
# HTML PROOFER
#====================
echo "travis_fold:start:run_html_proofer"
echo "Start html proofer check"
# Check that everything is ok with htmlproofer
# Must first enter jekyll folder to access the Gemfile.
cd jekyll
bundle exec htmlproofer site --url-ignore "https://www.linkedin.com/in/gregoire-boiron/,https://www.latecoere.aero/en/"
echo "travis_fold:end:run_html_proofer"

echo "postprocess.sh script done."