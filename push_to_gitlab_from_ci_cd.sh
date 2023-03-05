#!/bin/bash
# Set CI/CD variables for the bot credentials. Bot must be a user in the repo with sufficent access.
git config --global user.name "$BOT_NAME"
git config --global user.email "$BOT_EMAIL"
git checkout -b ci_cd_branch
git add .
git commit -m "Updating the repository from a pipeline."
# Create a project access token and store the token in a CI/CD variable named PROJECT_TOKEN
# Use pre-defined variables CI_SERVER_HOST and CI_PROJECT_PATH
git remote set-url origin "https://gitlab-ci-token:${PROJECT_TOKEN}@${CI_SERVER_HOST}/${CI_PROJECT_PATH}.git"
git push -u origin ci_cd_branch
# clean up so GitLab can't store this new branch into the cache
git checkout $CI_COMMIT_SHA
git branch -D ci_cd_branch
# call merge request script (use "source" to pass in current bash variables)
source_branch="ci_cd_branch"
target_branch="main"
source ./create_merge_request_api.sh
