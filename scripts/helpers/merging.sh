#!/bin/bash

########################################################################################
# Grégoire Boiron <gregoire.boiron@gmail.com>
# Copyright (c) 2018-2020 Grégoire Boiron  All Rights Reserved.
#
# Merge the build branch back into the building branch by squashing it into one commit.
########################################################################################

buildbranch=travis-build-${TRAVIS_BUILD_NUMBER}

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

# Run git fetch in order to have all the refs including the dedicated branch created by the branching job
# See https://docs.travis-ci.com/user/customizing-the-build#git-clone-depth
# git fetch --unshallow

# Check if we have create the dedicated branch first
# See https://stackoverflow.com/questions/5167957/is-there-a-better-way-to-find-out-if-a-local-git-branch-exists
echo "$buildbranch"
exists=$(git show-ref "$buildbranch")
echo "$exists"

if [ -n "$exists" ]; then
    echo 'branch exists!'
    
    # checkout the branch
    git checkout $buildbranch

    # TODO: Check if the dedicated branch contains commits to be merged before doing a squash merge
    findCommandGit=$(git log ${TRAVIS_BRANCH}.. --oneline --format=format:"%H" | tail -1)
    echo $findCommandGit
    echo $($findCommandGit | head -c1 | wc -c)

    if [[ $($findCommandGit | head -c1 | wc -c) -ne 0 ]]; then
        echo "travis_fold:start:merge_travis_branch"
        echo "Create new branch dedicated for the build ${TRAVIS_BUILD_NUMBER}"
        git checkout ${TRAVIS_BRANCH}
        git merge --squash $buildbranch
        git commit -m "+ add files from travid build #${TRAVIS_BUILD_NUMBER}"
        git push
        echo "travis_fold:end:merge_travis_branch"
    else
        echo "⏭️ No commits made on the branch $buildbranch. Skipped branch squashing."
    fi

    echo "travis_fold:start:delete_travis_branch"
    echo "Delete dedicated branch because it will not be usefull anymore"
    # Leave the branch in case we're still on it
    git checkout ${TRAVIS_BRANCH}
    # Delete it
    git push -d origin $buildbranch
    echo "travis_fold:end:delete_travis_branch"
else
    echo "⏭️ No dedicated branch created. Job skipped."
fi
echo "✅ merging.sh script done."
