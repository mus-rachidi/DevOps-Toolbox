#!/bin/bash

# Color variables
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Update the package list
sudo apt-get update

# Install the unzip package
sudo apt-get install unzip -y

# Read the Terraform version from user input
echo -e "${GREEN}Enter the Terraform version to install (e.g., 1.0.9):${NC}"
read -p "" TF_VERSION

# Download the specified Terraform binary
wget "https://releases.hashicorp.com/terraform/${TF_VERSION}/terraform_${TF_VERSION}_linux_amd64.zip"

# Extract the downloaded archive
unzip "terraform_${TF_VERSION}_linux_amd64.zip"

# Move the extracted binary to the /usr/local/bin directory
sudo mv terraform /usr/local/bin/

# Verify that Terraform is installed and working
terraform --version

#delete zip files 

rm -rf *.zip
