#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# Run webp conversion on all images.
#############################################################################

# Try to find if any file matching the provided extension
jpgResult=$( ./scripts/file-changed-in-last-commit.sh "*\.jpg$" )
pngResult=$( ./scripts/file-changed-in-last-commit.sh "*\.png$" )

echo "$jpgResult"
echo "$pngResult"

if [[ "$jpgResult" -ne 0 ]] || [[ "$pngResult" -ne 0 ]] ; then
  # Download the package
  echo "travis_fold:start:install_webp"
  echo "install webp for webp encoding"
  sudo apt-get install webp
  echo "travis_fold:end:install_webp"

  # Encode images using cwebp
  echo "travis_fold:start:run_cwebp"
  echo "Start running cwebp for webp image creation"
  # Use cwebp to encode all asset images. see https://developers.google.com/speed/webp/docs/precompiled
  find jekyll/assets/ \( -name "*.jpg" -o -name "*.png" \) -exec cwebp {} -o {}.webp \;
  find jekyll/assets/ -name "*.webp" -exec rename "s/\.png|\.jpg//g" {} \;
  echo "travis_fold:end:run_cwebp"
  
  # Upload back to github the artifacts created
  echo "travis_fold:start:push_webp"
  echo "push new webp images to the branch"
  ./scripts/helpers/upload-new-file.sh "*.webp"
  echo "travis_fold:end:push_webp"
else
  echo "⏭️ No jpg or png in the last commit. Job skipped."
fi
echo "✅ webp-conversion.sh script done."
