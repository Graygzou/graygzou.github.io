#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# Build
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

echo "build.sh script done."