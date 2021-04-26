#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2021 Grégoire Boiron  All Rights Reserved.
#############################################################################

# Download package
# curl -L allow to follow the redirection
echo "::group::download_guetzli"
curl -L https://github.com/google/guetzli/archive/v1.0.1.tar.gz | tar zx
sudo apt-get install libpng-dev
echo "::endgroup::"

echo "::group::install_guetzli"
echo "install guetzli for jpg compression"
cd guetzli-1.0.1 && make
echo "::endgroup::"

# Run the package
echo "::group::run_guetzli"
echo "Start run guetzli for jpg compression"
# For all the jpg in the project run Guetzli.
# See https://github.com/google/guetzli for more info
find jekyll/assets/ -name "*.jpg" ! -path "jekyll/assets/originals/*" -exec guetzli-1.0.1/bin/Release/guetzli --verbose {} {} \;
echo "::endgroup::"

echo "✅ guetzli-compression.sh script done."
