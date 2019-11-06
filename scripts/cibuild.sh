#!/bin/bash

# Enable error reporting to the console.
set -e

cd jekyll

# Build the website with the production variable
JEKYLL_ENV=production bundle exec jekyll build --destination site
