#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# Run webp conversion on all images.
#############################################################################

# The -e flag causes the script to exit as soon as one command returns a non-zero exit code
# The -v flag makes the shell print all lines in the script before executing them, which helps identify which steps failed.
set -ev

# Download the package
echo "travis_fold:start:install_webp"
echo "install webp for webp encoding"
sudo apt-get install webp
echo "travis_fold:end:install_webp"

# Encode images using cwebp
echo "travis_fold:start:run_cwebp"
echo "Start run guetzli for jpg compression"
# Use cwebp to encode all asset images. see https://developers.google.com/speed/webp/docs/precompiled
find jekyll/assets/ \( -name "*.jpg" -o -name "*.png" \) -exec cwebp {} -o {}.webp \;
find jekyll/assets/ -name "*.webp" -exec rename "s/\.png|\.jpg//g" {} \;
echo "travis_fold:end:run_cwebp"

echo "webp-conversion.sh script done."
