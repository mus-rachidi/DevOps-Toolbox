#!/bin/bash

# Update the apt package index and install packages to allow apt to use a repository over HTTPS
sudo apt-get update
sudo apt-get install apt-transport-https ca-certificates curl gnupg lsb-release -y

# Add Docker's official GPG key
curl -fsSL https://download.docker.com/linux/ubuntu/gpg | sudo gpg --dearmor -o /usr/share/keyrings/docker-archive-keyring.gpg

# Add the Docker repository to APT sources
echo "deb [arch=amd64 signed-by=/usr/share/keyrings/docker-archive-keyring.gpg] https://download.docker.com/linux/ubuntu $(lsb_release -cs) stable" | sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

# Update the apt package index and install the latest version of Docker
sudo apt-get update
sudo apt-get install docker-ce docker-ce-cli containerd.io -y

# Add the current user to the docker group
sudo usermod -aG docker $USER

# Restart the Docker daemon to apply the changes
sudo systemctl restart docker   

