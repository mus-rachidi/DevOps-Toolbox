#!/bin/bash

# Define variables
CERT_NAME="mycertificate"
CERT_VALIDITY=365

# Function to generate a self-signed SSL certificate
generate_self_signed_certificate() {
  echo "Generating self-signed SSL certificate..."
  sudo openssl req -x509 -nodes -days $CERT_VALIDITY -newkey rsa:2048 -keyout $CERT_NAME.key -out $CERT_NAME.crt
}

# Main script

# Generate self-signed SSL certificate
generate_self_signed_certificate
