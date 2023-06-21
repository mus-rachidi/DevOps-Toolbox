#!/bin/bash

# Update package list
sudo apt update

# Install dependencies
sudo apt install -y curl gpg software-properties-common apt-transport-https

# Import Microsoft GPG key
curl -sSL https://packages.microsoft.com/keys/microsoft.asc | sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/microsoft.gpg

# Add Visual Studio Code repository
echo "deb [arch=amd64] https://packages.microsoft.com/repos/vscode stable main" | sudo tee /etc/apt/sources.list.d/vscode.list

# Update package list again
sudo apt update

# Install Visual Studio Code
sudo apt install -y code

# Launch Visual Studio Code
code

