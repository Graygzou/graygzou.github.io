#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#############################################################################

# Try to find if any file matching the provided extension
jpgResult=$( ./scripts/file-changed-in-last-commit.sh "*.jpg" )

echo "$jpgResult"

if [[ "$jpgResult" -ne 0 ]] ; then
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

    # Upload artifacts to the repo
    echo "travis_fold:start:push_results"
    echo "push compressed jpg images to the branch"
    ./scripts/upload-new-file.sh "*.jpg"
    echo "travis_fold:end:push_results"
else
    echo "⏭️ No jpg in the last commit. Job skipped."
fi

echo "✅ guetzli-compression.sh script done."