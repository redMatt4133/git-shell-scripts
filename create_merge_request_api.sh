#!/bin/bash
# Using pre-defined Gitlab CI/CD variables - CI_SERVER_HOST, CI_PROJECT_ID
# Create a project access token and store the token into a custom CI/CD variable named PROJECT_TOKEN
curl --request POST --header "PRIVATE-TOKEN: ${PROJECT_TOKEN}" --data "source_branch=${source_branch}&target_branch=${target_branch}&title=Merge ${source_branch} into ${target_branch}" "https://${CI_SERVER_HOST}/api/v4/projects/${CI_PROJECT_ID}/merge_requests"
