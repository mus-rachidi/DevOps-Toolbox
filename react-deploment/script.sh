#!/bin/bash

# Define variables
APP_NAME="my-react-app"
APP_REPO="https://github.com/myusername/my-react-app.git"
APP_DIR="/var/www/my-react-app"
ENV_FILE="/var/www/my-react-app/.env"
DOCKER_IMAGE_NAME="my-react-app-image"
DOCKER_CONTAINER_NAME="my-react-app-container"

# Function to deploy the application
deploy() {
  echo "Deploying $APP_NAME..."

  # Pull the latest code from the repository
  git clone $APP_REPO $APP_DIR

  # Go to the application directory
  cd $APP_DIR

  # Install dependencies
  npm install

  # Build the application
  npm run build

  # Copy environment variables
  cp /path/to/production.env $ENV_FILE

  # Build the Docker image
  docker build -t $DOCKER_IMAGE_NAME .

  # Stop and remove existing container
  docker stop $DOCKER_CONTAINER_NAME
  docker rm $DOCKER_CONTAINER_NAME

  # Run the Docker container
  docker run -d -p 80:80 --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_NAME

  echo "Deployment complete!"
}

# Function to rollback to the previous version
rollback() {
  echo "Rolling back $APP_NAME to the previous version..."

  # Stop and remove existing container
  docker stop $DOCKER_CONTAINER_NAME
  docker rm $DOCKER_CONTAINER_NAME

  # Run the previous Docker image
  docker run -d -p 80:80 --name $DOCKER_CONTAINER_NAME $DOCKER_IMAGE_NAME:previous

  echo "Rollback complete!"
}

# Main script

# Parse command line arguments
if [[ $1 == "deploy" ]]; then
  deploy
elif [[ $1 == "rollback" ]]; then
  rollback
else
  echo "Usage: ./deploy.sh [deploy|rollback]"
fi
