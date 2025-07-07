#!/bin/bash

# Stop and remove the container based on image
container_id=$(docker ps -q --filter "ancestor=abdulrajak/devops_cicd_task_flask_app:latest")

if [ -z "$container_id" ]; then
  echo "No running container found for this image."
else
  echo "Stopping container $container_id..."
  docker stop "$container_id"
  docker rm "$container_id"
  echo "Container stopped and removed."
fi
