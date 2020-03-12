#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# create branch to gather all commits made by travis jobs
#############################################################################

echo "travis_fold:start:create_new_branch"
echo "Create new branch dedicated for the build ${TRAVIS_BUILD_NUMBER}"
git branch travis-build-${TRAVIS_BUILD_NUMBER}
echo "travis_fold:end:create_new_branch"

echo "travis_fold:start:push_branch_origin"
echo "Push created branch so other job can use it when pushing"
git push -u origin travis-build-${TRAVIS_BUILD_NUMBER}
echo "travis_fold:end:push_branch_origin"
