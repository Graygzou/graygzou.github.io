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

# Run html-proofer to see if there is any errors
echo "travis_fold:start:run_html_proofer"
echo "Start html proofer check"
# Check that everything is ok with htmlproofer
# Must first enter jekyll folder to access the Gemfile.
cd jekyll
bundle exec htmlproofer site --url-ignore "https://www.linkedin.com/in/gregoire-boiron/,https://www.latecoere.aero/en/"
echo "travis_fold:end:run_html_proofer"

echo "build.sh script done."