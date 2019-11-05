#!/bin/bash

# Enable error reporting to the console.
set -e

# If debug is needed, uncomment this line.
# It will allow to connect remotly to the travis TRAVIS_BUILD_NUMBER
curl https://www.teleconsole.com/get.sh | sh
teleconsole

# For all the png in the project run https://pngquant.org/pngquant.tar.bz2
# TODO find -depth -name "*.png"

# For all the jpg in the project run Guetzli.
# See https://github.com/google/guetzli for more info
brew install guetzli

# Run the exe for each jpg found
#find -depth -name "*.jpg" -exec guetzli --verbose {} {}
