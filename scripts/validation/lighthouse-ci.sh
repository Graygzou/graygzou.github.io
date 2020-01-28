#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# Lighthouse-ci
#############################################################################

# Download the package
echo "travis_fold:start:install_lighthouse_ci"
echo "install lighthouse-ci"
npm install -g @lhci/cli@0.3.x
echo "travis_fold:end:install_lighthouse_ci"

# Deploy the website locally so lighthouse can run tests on it
# --detach option let us run commands after serving the site
echo "travis_fold:start:run_local_build"
echo "build jekyll site in local to test it"
( cd jekyll && bundle exec jekyll serve --detach \;)
echo "travis_fold:end:run_local_build"

# Create the config for lighthouse-ci
echo "travis_fold:start:init_lighthouse_config"
echo "create lighthouse-ci config"
( cd scripts/validation && python getAllWebsitePages.py 0 "../jekyll/_site/sitemap.xml" \;)
echo "travis_fold:end:init_lighthouse_config"

# Make sure the config is safe
echo "travis_fold:start:healthcheck_lighthouse"
echo "healthcheck lighthouse-ci"
lhci healthcheck --fatal --checks=githubToken
echo "travis_fold:end:healthcheck_lighthouse"

# Run the tests
echo "travis_fold:start:start_lighthouse"
echo "start lighthouse-ci"
lhci autorun --config=./lighthouserc.json
echo "travis_fold:end:start_lighthouse"

# Kill the background process of the deployment
echo "travis_fold:start:kill_local_build"
echo "start lighthouse-ci"
pkill -f jekyll
echo "travis_fold:end:kill_local_build"

echo "lighthouse-ci.sh script done."