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

  echo "travis_fold:start:clone_project"
  echo "Clone project"
  git clone https://${GITHUB_BOT_NAME}:${BOT_DEPLOY_TOKEN}@github.com/Graygzou/graygzou.github.io.git ../graygzou.github.io.develop
  cd ../graygzou.github.io.develop
  echo "travis_fold:end:clone_project"

  chmod +x scripts/*/*.sh

  extension1="jpg"
  extension2="png"

  ./scripts/generation/image-magick.sh $extension1
  ./scripts/generation/image-magick.sh $extension2

  # Upload back to github the artifacts created
  echo "travis_fold:start:push_resize"
  echo "push new resized images to the branch"
  ./scripts/helpers/upload-changed-files.sh "jekyll/assets/.*\[[0-9]*x[0-9]*\].$extension1$ jekyll/assets/.*\[[0-9]*x[0-9]*\].$extension2$"
  echo "travis_fold:end:push_resize"
else
  echo "⏭️ No jpg or png in the last commit. Job skipped."
fi
echo "✅ resize-img.sh script done."
