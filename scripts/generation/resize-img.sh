#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# Run ImageMagick algorithm to create different versions of all images
#############################################################################

# Try to find if any file matching the provided extension
jpgResult=$( ./scripts/helpers/file-changed-in-last-commit.sh "*\.jpg$" )
pngResult=$( ./scripts/helpers/file-changed-in-last-commit.sh "*\.png$" )

echo "$jpgResult"
echo "$pngResult"

# For debug purpose
jpgResult=0
pngResult=0

# echo "jekyll/assets/images/lilo[200x200].jpg" | tr -cd '0-9x'

# Debug
#curl https://www.teleconsole.com/get.sh | sh
#teleconsole

if [[ "$jpgResult" -ne 1 ]] || [[ "$pngResult" -ne 1 ]] ; then
  # Download the package
  echo "travis_fold:start:install_magick"
  echo "install image magick for image resizing"
  wget https://www.imagemagick.org/download/ImageMagick.tar.gz
  tar xf ImageMagick.tar.gz
  cd ImageMagick-7*
  ./configure
  make
  sudo make install
  sudo ldconfig /usr/local/lib
  identify -version
  cd ..
  echo "travis_fold:end:install_magick"

  ./scripts/generation/image-magick.sh "jpg"
  ./scripts/generation/image-magick.sh "png"
else
  echo "⏭️ No jpg or png in the last commit. Job skipped."
fi
echo "✅ resize-img.sh script done."
