#!/bin/bash
set -e

# Pull the latest Docker image from Docker Hub
docker pull abdulrajak/devops_cicd_task_flask_app:staging

# Stop and remove any running containers based on that image
old_container=$(docker ps -q --filter "ancestor=abdulrajak/devops_cicd_task_flask_app:staging")
if [ ! -z "$old_container" ]; then
    echo "Stopping old container..."
    docker stop "$old_container"
    docker rm "$old_container"
fi

# Start the new container on port 5001
echo "Starting the container..."
docker run -d -p 5001:5001 abdulrajak/devops_cicd_task_flask_app:staging
echo "Container started successfully at http://localhost:5001"
