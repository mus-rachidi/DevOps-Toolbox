#!/bin/bash

# Function to create a backup of a directory
create_backup() {
  local source_dir=$1
  local backup_dir=$2

  echo "Creating backup..."
  # Create backup directory if it doesn't exist
  mkdir -p "$backup_dir"
  # Copy the source directory to the backup directory
  cp -R "$source_dir" "$backup_dir"
}

# Main script

# Check if both source and backup directories are provided as arguments
if [ $# -lt 2 ]; then
  echo "Usage: $0 <source_directory> <backup_directory>"
  exit 1
fi

# Assign command-line arguments to variables
source_directory="$1"
backup_directory="$2"

# Create a backup of the directory
create_backup "$source_directory" "$backup_directory"
