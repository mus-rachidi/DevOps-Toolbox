#!/bin/bash

# Define color codes
RED='\033[0;31m'
GREEN='\033[0;32m'
NC='\033[0m' # No color

# Read commit message from user input
echo -e "${GREEN}Enter commit message:${NC}"
read commit_message

# Read branch name from user input
echo -e "${GREEN}Enter branch name:${NC}"
read branch_name

# Read remote repository name from user input
echo -e "${GREEN}Enter remote repository name:${NC}"
read remote_name

# Add all files to the repository
git add .

# Commit the changes with the user input commit message
git commit -m "$commit_message"

# Push the changes to the specified branch on the remote repository
git push $remote_name $branch_name
