#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# Run webp conversion on all images.
#############################################################################

# Try to find if any file matching the provided extension
jpgResult=$( ./scripts/helpers/file-changed-in-last-commit.sh "*\.jpg$" )
pngResult=$( ./scripts/helpers/file-changed-in-last-commit.sh "*\.png$" )

echo "$jpgResult"
echo "$pngResult"

if [[ "$jpgResult" -ne 1 ]] || [[ "$pngResult" -ne 1 ]] ; then
  # Download the package
  echo "travis_fold:start:install_webp"
  echo "install webp for webp encoding"
  sudo apt-get install webp
  echo "travis_fold:end:install_webp"

  echo "travis_fold:start:clone_project"
  echo "Clone project"
  git clone https://${GITHUB_BOT_NAME}:${BOT_DEPLOY_TOKEN}@github.com/Graygzou/graygzou.github.io.git ../graygzou.github.io.develop
  cd ../graygzou.github.io.develop
  echo "travis_fold:end:clone_project"

  chmod +x scripts/*/*.sh

  # Remove the old directory and create a new one if necessary
  echo "travis_fold:start:create_webp_folder"
  echo "Remove all webp folder"
  if [[ -d "jekyll/assets/webp" ]]; then
    # Remove the old directory to create a new one
    rm -vrf jekyll/assets/webp
  fi
  mkdir jekyll/assets/webp
  echo "travis_fold:end:create_webp_folder"

  # Encode images using cwebp
  echo "travis_fold:start:run_cwebp"
  echo "Start running cwebp for webp image creation"
  # Use cwebp to encode all asset images except for the folder ./originals. 
  # see https://developers.google.com/speed/webp/docs/precompiled
  find jekyll/assets/ -type d -path jekyll/assets/originals -prune -o -regex '.*\.\(jpg\|png\)' -print -exec cwebp {} -o {}.webp \;
  
  echo "travis_fold:end:run_cwebp"

  git status

  # Move images and format them
  echo "travis_fold:start:rename_webp_images"
  echo "Renamed new images and move them in a separated folder"
  find jekyll/assets/ -name "*.webp" -exec mv {} jekyll/assets/webp/ \;
  cd jekyll/assets/webp/ && rename -v 's/.png.webp|.jpg.webp/.webp/gi' *.webp \;
  find . -regex '.*\.\(png\.webp\|jpg\.webp\)' -exec rm -v {} \;
  cd ../../..
  echo "travis_fold:end:rename_webp_images"
  
  git status

  # Debug
  # curl https://www.teleconsole.com/get.sh | sh
  # teleconsole

  # Upload back to github the artifacts created
  echo "travis_fold:start:push_webp"
  echo "push new webp images to the branch"
  ./scripts/helpers/upload-new-files.sh "webp"
  echo "travis_fold:end:push_webp"
else
  echo "⏭️ No jpg or png in the last commit. Job skipped."
fi
echo "✅ webp-conversion.sh script done."
