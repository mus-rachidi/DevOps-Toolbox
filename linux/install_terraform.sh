#!/bin/bash

# Update package lists
sudo apt update

# Install required dependencies
sudo apt install -y unzip

# Download the latest version of Terraform
TERRAFORM_VERSION=$(curl -s https://api.github.com/repos/hashicorp/terraform/releases/latest | grep "tag_name" | cut -d '"' -f 4)
wget "https://releases.hashicorp.com/terraform/${TERRAFORM_VERSION}/terraform_${TERRAFORM_VERSION}_linux_amd64.zip" -O terraform.zip

# Unzip the downloaded file
unzip terraform.zip

# Move the Terraform binary to /usr/local/bin
sudo mv terraform /usr/local/bin/

# Set the appropriate permissions
sudo chmod +x /usr/local/bin/terraform

# Clean up the downloaded files
rm terraform.zip

# Verify the installation
terraform version

