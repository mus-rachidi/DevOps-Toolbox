#!/bin/bash

# Define variables
APP_NAME="my-django-app"
# APP_REPO="https://github.com/myusername/my-django-app.git"
APP_DIR="/var/www/my-django-app"
ENV_FILE="/var/www/my-django-app/.env"
DOCKER_IMAGE_NAME="my-django-app-image"
DOCKER_CONTAINER_NAME="my-django-app-container"
DOCKER_NETWORK="my-network"

# Function to deploy the application
deploy() {
  echo "Deploying $APP_NAME..."

  # Pull the latest code from the repository
  # git clone $APP_REPO $APP_DIR

  # Go to the application directory
  cd $APP_DIR

  # Create and activate a virtual environment
  python3 -m venv venv
  source venv/bin/activate

  # Install dependencies
  pip install -r requirements.txt

  # Copy environment variables
  cp /path/to/production.env $ENV_FILE

  # Run database migrations
  python manage.py migrate

  # Collect static files
  python manage.py collectstatic --noinput

  # Build the Docker image
  docker build -t $DOCKER_IMAGE_NAME .

  # Stop and remove existing container
  docker stop $DOCKER_CONTAINER_NAME
  docker rm $DOCKER_CONTAINER_NAME

  # Run the Docker container
  docker run -d -p 80:80 --name $DOCKER_CONTAINER_NAME --network $DOCKER_NETWORK $DOCKER_IMAGE_NAME

  echo "Deployment complete!"
}

# Function to rollback to the previous version
rollback() {
  echo "Rolling back $APP_NAME to the previous version..."

  # Stop and remove existing container
  docker stop $DOCKER_CONTAINER_NAME
  docker rm $DOCKER_CONTAINER_NAME

  # Run the previous Docker image
  docker run -d -p 80:80 --name $DOCKER_CONTAINER_NAME --network $DOCKER_NETWORK $DOCKER_IMAGE_NAME:previous

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
