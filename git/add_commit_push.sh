#!/bin/bash

# read commit message from user input
echo "Enter commit message:"
read commit_message

# read branch name from user input
echo "Enter branch name:"
read branch_name

# read remote repository name from user input
echo "Enter remote repository name:"
read remote_name

# add all files to the repository
git add .

# commit the changes with the user input commit message
git commit -m "$commit_message"

# push the changes to the specified branch on the remote repository
git push $remote_name $branch_name

