#!/bin/bash
set -e

# Pull the latest production image
docker pull abdulrajak/devops_cicd_task_flask_app:prod

# Stop and remove any running containers based on prod image
old_container=$(docker ps -q --filter "ancestor=abdulrajak/devops_cicd_task_flask_app:prod")
if [ ! -z "$old_container" ]; then
    echo "Stopping old container..."
    docker stop "$old_container"
    docker rm "$old_container"
fi

# Start the new container
echo "Starting the container..."
docker run -d -p 5001:5001 abdulrajak/devops_cicd_task_flask_app:prod
echo "Container started successfully at http://localhost:5001"
