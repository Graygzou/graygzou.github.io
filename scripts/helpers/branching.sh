#!/bin/bash

#############################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# create branch to gather all commits made by travis jobs
#############################################################################

echo "travis_fold:start:config_user"
echo "Config github bot user"
git config user.email ${GITHUB_BOT_MAIL}
git config user.name ${GITHUB_BOT_NAME}
echo "travis_fold:end:config_user"

echo "travis_fold:start:clone_project"
echo "Clone project"
git clone https://${GITHUB_BOT_NAME}:${BOT_DEPLOY_TOKEN}@github.com/Graygzou/graygzou.github.io.git ../graygzou.github.io.cloned
cd ../graygzou.github.io.cloned
echo "travis_fold:end:clone_project"

echo "travis_fold:start:create_new_branch"
echo "Create new branch dedicated for the build ${TRAVIS_BUILD_NUMBER}"
git branch travis-build-${TRAVIS_BUILD_NUMBER}
echo "travis_fold:end:create_new_branch"

echo "travis_fold:start:change_remote"
echo "Change remote from https to ssh"
git remote -v
git remote remove origin
git remote add origin git@github.com:user/repo.git
git remote -v
echo "travis_fold:end:change_remote"

git status

echo "travis_fold:start:push_branch_origin"
echo "Push created branch so other job can use it when pushing"
git push -u origin travis-build-${TRAVIS_BUILD_NUMBER}
echo "travis_fold:end:push_branch_origin"

git status