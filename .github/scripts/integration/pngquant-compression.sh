#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2021 Grégoire Boiron  All Rights Reserved.
#
# Script that run pngquant.
#############################################################################

# Install the package
echo "::group::install_pngquant"
echo "install pngquant for png compression"
sudo apt-get install pngquant
echo "::endgroup::"

# Run the package
echo "::group::run_pngquant"
echo "Run pngquant command"
# This will create duplicate of images with -fs8 at the end of the file
find ./jekyll/assets/project-images/ -name "*.png" -not -name "*-opti.png" -exec pngquant --ext -opti.png {} \;

# Remove the previous image not optimized
echo "Remove the previous image not optimized"
find ./jekyll/assets/project-images/ -name "*.png" -not -name "*-opti.png" -exec rm {} \;
echo "::endgroup::"

# Rename the file generate to match previous version
# echo "Rename compressed images to match declarations"
# find ./jekyll/assets/project-images/ -name "*.png" -exec rename "s/-fs8//g" {} \;

echo "✅ pngquant-compression.sh script done."
