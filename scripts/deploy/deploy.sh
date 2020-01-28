#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# deploy
#############################################################################

cd jekyll

#---------------------------------------------------------------
# The build that will be deploy to github-page
#
# Build the website with the production variable
#---------------------------------------------------------------
echo "travis_fold:start:jekyll_production_build"
echo "build jekyll site with the production variable"
bundle exec jekyll build JEKYLL_ENV=production --destination site
echo "travis_fold:end:jekyll_production_build"
echo "jekyll build done."

# Upload back to github the artifacts created
echo "travis_fold:start:push_webp"
echo "push new webp images to the branch"
./scripts/helpers/upload-new-file.sh "site/*" "release"
echo "travis_fold:end:push_webp"

echo "✅ deploy.sh script done."