#!/bin/bash

# Enable error reporting to the console.
set -e

cd jekyll

# Build the website with the production variable
JEKYLL_ENV=production bundle exec jekyll build --destination site

# Check that everything is ok with htmlproofer
bundle exec htmlproofer site --href_ignore https://www.linkedin.com/in/gregoire-boiron/