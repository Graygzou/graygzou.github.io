#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# html-proofer
#############################################################################

# The -e flag causes the script to exit as soon as one command returns a non-zero exit code
# The -v flag makes the shell print all lines in the script before executing them, which helps identify which steps failed.
set -ev

# Run the program
echo "travis_fold:start:run_html_proofer"
echo "Start html proofer check"
# Check that everything is ok with htmlproofer
# Must first enter jekyll folder to access the Gemfile.
cd jekyll
bundle exec htmlproofer site --url-ignore "https://www.linkedin.com/in/gregoire-boiron/,https://www.latecoere.aero/en/"
echo "travis_fold:end:run_html_proofer"

echo "html-proofer.sh script done."