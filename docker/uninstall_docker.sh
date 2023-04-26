#!/bin/bash

# Stop Docker service
sudo systemctl stop docker

# Remove Docker packages
sudo apt-get purge docker-ce docker-ce-cli containerd.io

# Remove Docker data
sudo rm -rf /var/lib/docker

# Remove Docker directories
sudo rm -rf /etc/docker
sudo rm -rf /var/run/docker.sock

# Remove Docker user group
sudo groupdel docker

