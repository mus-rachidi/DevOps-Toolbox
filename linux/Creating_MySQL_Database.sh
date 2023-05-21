#!/bin/bash

# Define variables
DB_NAME="mydatabase"
DB_USER="myuser"
DB_PASSWORD="mypassword"

# Function to create a MySQL database and user
create_database_and_user() {
  echo "Creating MySQL database and user..."
  # Create database
  sudo mysql -e "CREATE DATABASE IF NOT EXISTS $DB_NAME;"
  # Create user and grant privileges
  sudo mysql -e "GRANT ALL PRIVILEGES ON $DB_NAME.* TO '$DB_USER'@'localhost' IDENTIFIED BY '$DB_PASSWORD';"
  sudo mysql -e "FLUSH PRIVILEGES;"
}

# Main script

# Create MySQL database and user
create_database_and_user
