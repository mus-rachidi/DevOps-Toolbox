#!/bin/bash

# Function to configure firewall rules
configure_firewall() {
  echo "Configuring firewall..."
  # Allow SSH
  sudo ufw allow OpenSSH
  # Allow HTTP
  sudo ufw allow 80/tcp
  # Allow HTTPS
  sudo ufw allow 443/tcp
  # Enable firewall
  sudo ufw enable
}

# Main script

# Configure firewall
configure_firewall
