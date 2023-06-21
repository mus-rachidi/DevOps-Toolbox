#!/bin/bash

# Color variables
GREEN='\033[0;32m'
NC='\033[0m' # No Color

# Update the package list
sudo apt-get update

# Install virtualization dependencies
sudo apt-get install -y curl wget apt-transport-https virtualbox

# Install kubectl
sudo curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/stable.txt)/bin/linux/amd64/kubectl"
sudo chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Install Docker
sudo apt-get install -y docker.io

# Install Minikube
sudo curl -LO "https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64"
sudo install minikube-linux-amd64 /usr/local/bin/minikube

# Start Minikube cluster
minikube start --driver=virtualbox

# Verify Kubernetes cluster is running
kubectl cluster-info
# install kubectl
curl -LO "https://dl.k8s.io/release/v1.22.0/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/
sudo mv kubectl /usr/local/bin/

echo -e "${GREEN}Kubernetes and Minikube have been installed successfully.${NC}"

