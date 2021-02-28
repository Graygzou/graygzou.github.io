#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# Build
#############################################################################

# Try to find if any file matching the provided extension
result=$( ./scripts/helpers/file-changed-in-last-commit.sh "*\.svg$" )

echo "$result"

if [ "$result" = 0 ]; then
    pip install -r requirements.txt
    python ./scripts/generation/mainSvgGen.py
else
    echo "⏭️ No svg in the last commit. Job skipped."
fi

echo "✅ group-svg.sh script done."
