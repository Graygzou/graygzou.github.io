#!/bin/bash

########################################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# Merge the build branch back into the building branch by squashing it into one commit.
########################################################################################

travis-branch=travis-build-${TRAVIS_BUILD_NUMBER}

# Check if we have create the dedicated branch first
# See https://stackoverflow.com/questions/5167957/is-there-a-better-way-to-find-out-if-a-local-git-branch-exists
exists=$(git show-ref refs/heads/$travis-branch)
if [ -n "$exists" ]; then
    echo 'branch exists!'
    
    # TODO: Check if the dedicated branch contains commits to be merged before doing a squash merge
    
    echo "travis_fold:start:merge_travis_branch"
    echo "Create new branch dedicated for the build ${TRAVIS_BUILD_NUMBER}"
    git checkout ${TRAVIS_BRANCH}
    git merge --squash $travis-branch
    git commit -m "+ add files from travid build #${TRAVIS_BUILD_NUMBER}"
    git push
    echo "travis_fold:end:create_new_branch"

    echo "travis_fold:start:delete_travis_branch"
    echo "Delete dedicated branch because it will not be usefull anymore"
    gir branch -d $travis-branch
    echo "travis_fold:end:delete_travis_branch"
else
    echo "⏭️ No dedicated branch created. Job skipped."
fi

echo "✅ merging.sh script done."
