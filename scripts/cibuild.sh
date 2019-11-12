#!/bin/bash
#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#############################################################################

# Enable error reporting to the console.
set -e

cd jekyll

# Build the website with the production variable
JEKYLL_ENV=production bundle exec jekyll build --destination site
