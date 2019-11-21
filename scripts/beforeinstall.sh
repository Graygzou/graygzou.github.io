#!/bin/bash
#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#############################################################################

# Enable error reporting to the console.
set -e

#----------------------------------------------------------
# Download file useful for the images optimization
#----------------------------------------------------------
echo "travis_fold:start:install_pngquant"
# pngquant for png
sudo apt-get install pngquant
echo "travis_fold:end:install_pngquant"

echo "travis_fold:start:install_guetzli"
# guetzli for jpg
# -L allow to follow the redirection
curl -L https://github.com/google/guetzli/archive/v1.0.1.tar.gz | tar zx
sudo apt-get install libpng-dev
cd guetzli-1.0.1 && make
echo "travis_fold:end:install_guetzli"

# gif ?
