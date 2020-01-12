#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
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

#---------------------------------------------------------------
# Useful to run lighthouse tests on it
# --detach option let us run commands after serving the site
# /!\ Don't forget to kill the process created !
#---------------------------------------------------------------
echo "travis_fold:start:jekyll_local_build"
echo "build jekyll site with the production variable"
bundle exec jekyll serve --detach
echo "travis_fold:end:jekyll_production_build"
echo "jekyll build done."