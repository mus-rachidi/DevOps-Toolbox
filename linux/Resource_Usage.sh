#!/bin/bash

# Function to monitor system resource usage
monitor_resource_usage() {
  echo "Monitoring system resource usage..."
  # Print CPU usage
  echo "CPU Usage:"
  top -bn 1 | grep "Cpu"
  # Print memory usage
  echo "Memory Usage:"
  free -h
  # Print disk usage
  echo "Disk Usage:"
  df -h
}

# Main script

# Monitor system resource usage
monitor_resource_usage
