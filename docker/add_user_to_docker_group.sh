#!/bin/bash

# Create the docker group if it doesn't already exist
sudo groupadd docker

# Add the current user to the docker group
sudo usermod -aG docker $USER

# Restart the Docker daemon to apply the changes
sudo service docker restart

