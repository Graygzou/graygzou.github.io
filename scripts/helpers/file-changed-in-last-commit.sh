#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2019 Grégoire Boiron  All Rights Reserved.
#
# Check if a file extension has been modify in the latest commit
#############################################################################

# Try to find if any file matching the provided extension
grep=$(egrep "$1" last-commit.txt)

if [ -n "$grep" ]; then
    echo 0
else
    echo 1
fi