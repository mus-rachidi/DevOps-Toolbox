#!/bin/bash

# Update packages
sudo apt update

# Install Java
sudo apt install default-jdk -y

# Fetch the latest Jenkins package
wget -q -O /tmp/jenkins.deb https://pkg.jenkins.io/debian-stable/binary/jenkins_$(curl -s https://pkg.jenkins.io/debian-stable/binary/ | grep -o 'jenkins_[0-9\.]*_all.deb' | awk -F'_' '{print $2}')_all.deb

# Install Jenkins
sudo dpkg -i /tmp/jenkins.deb
sudo apt --fix-broken install -y

# Start Jenkins service
sudo systemctl start jenkins

# Enable Jenkins to start on system boot
sudo systemctl enable jenkins

