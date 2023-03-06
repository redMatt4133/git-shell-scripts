#!/bin/bash
# Using pre-defined Gitlab CI/CD variables - CI_SERVER_HOST, CI_PROJECT_ID
# Create a personal access token and store the token into a custom CI/CD variable named PERSONAL_TOKEN
# Project access tokens cannot be used to create commits on a repo
branch_name="some-new-branch-name"
changed_file="change_file.txt"
curl --request POST \
     --form "branch=${branch_name}" \
     --form "commit_message=some commit message" \
     --form "actions[][action]=update" \
     --form "actions[][file_path]=${changed_file}" \
     --form "actions[][content]=<${changed_file}" \
     --form "actions[][action]=chmod" \
     --form "actions[][file_path]=${changed_file}" \
     --form "actions[][execute_filemode]=true" \
     --header "PRIVATE-TOKEN: ${PERSONAL_TOKEN}" \
     "https://${CI_SERVER_HOST}/api/v4/projects/${CI_PROJECT_ID}/repository/commits"
