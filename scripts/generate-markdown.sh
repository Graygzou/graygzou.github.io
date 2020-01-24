#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# Build
#############################################################################

pip install -r requirements.txt
python ./scripts/githubProjectGen.py $1

echo "✅ generate-markdown.sh script done."
