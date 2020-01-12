#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#############################################################################

#==========================================================
# Download file useful for the images optimization
#==========================================================

#----------------------------------------------------------
# PNG COMPRESSION: pngquant
#----------------------------------------------------------
echo "travis_fold:start:install_pngquant"
echo "install pngquant for png compression"
sudo apt-get install pngquant
echo "travis_fold:end:install_pngquant"

#----------------------------------------------------------
# JPG COMPRESSION: guetzli
#
# curl -L allow to follow the redirection
#----------------------------------------------------------
echo "travis_fold:start:install_guetzli"
echo "install guetzli for jpg compression"
curl -L https://github.com/google/guetzli/archive/v1.0.1.tar.gz | tar zx
sudo apt-get install libpng-dev
cd guetzli-1.0.1 && make
echo "travis_fold:end:install_guetzli"

#----------------------------------------------------------
# GIF compression
#----------------------------------------------------------
# TODO

echo "beforeinstall.sh script done."