#!/bin/bash

# Define variables
WEBSITE_URL="https://example.com"

# Function to check the HTTP status of a website
check_website_status() {
  echo "Checking website status..."
  status_code=$(curl -sL -w "%{http_code}" $WEBSITE_URL -o /dev/null)
  echo "HTTP status code: $status_code"
}

# Main script

# Check website status
check_website_status
