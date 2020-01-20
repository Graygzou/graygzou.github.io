#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#############################################################################

# The -e flag causes the script to exit as soon as one command returns a non-zero exit code
# The -v flag makes the shell print all lines in the script before executing them, which helps identify which steps failed.
set -ev

# Download package
# curl -L allow to follow the redirection
echo "travis_fold:start:install_guetzli"
echo "install guetzli for jpg compression"
curl -L https://github.com/google/guetzli/archive/v1.0.1.tar.gz | tar zx
sudo apt-get install libpng-dev
cd guetzli-1.0.1 && make
echo "travis_fold:end:install_guetzli"

# Run the package
echo "travis_fold:start:run_guetzli"
echo "Start run guetzli for jpg compression"
# For all the jpg in the project run Guetzli.
# See https://github.com/google/guetzli for more info
find jekyll/site/assets/ -name "*.jpg" -exec guetzli-1.0.1/bin/Release/guetzli --verbose {} {} \;
echo "travis_fold:end:run_guetzli"

#====================
# HTML PROOFER
#====================
echo "travis_fold:start:run_html_proofer"
echo "Start html proofer check"
# Check that everything is ok with htmlproofer
# Must first enter jekyll folder to access the Gemfile.
cd jekyll
bundle exec htmlproofer site --url-ignore "https://www.linkedin.com/in/gregoire-boiron/,https://www.latecoere.aero/en/"
echo "travis_fold:end:run_html_proofer"

echo "guetzli-compression.sh script done."