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

if [[ "$jpgResult" -ne 1 ]] || [[ "$pngResult" -ne 1 ]] ; then
  # Download the package
  echo "::group::install imagemagick"
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
  echo "::endgroup::"

  chmod +x scripts/*/*.sh

  echo "::group::run image magick script"
  ./scripts/generation/image-magick.sh "jpg"
  ./scripts/generation/image-magick.sh "png"
  echo "::endgroup::"

else
  echo "⏭️ No jpg or png in the last commit. Job skipped."
fi
echo "✅ resize-img.sh script done."
