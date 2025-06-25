#!/bin/bash

IMAGE_NAME="mohit682/node-app"
CONTAINER_NAME="node-app-auto"
LOCAL_IMAGE_ID=$(docker images --format "{{.Repository}}:{{.Tag}} {{.ID}}" | grep "$IMAGE_NAME:latest" | awk '{print $2}')
REMOTE_IMAGE_ID=$(docker pull $IMAGE_NAME:latest | grep Digest | awk '{print $2}')

# Compare image IDs
if [ "$LOCAL_IMAGE_ID" != "$REMOTE_IMAGE_ID" ]; then
  echo "🔁 New image found. Updating container..."
  docker stop $CONTAINER_NAME
  docker rm $CONTAINER_NAME
  docker run -d --name $CONTAINER_NAME -p 3000:3000 $IMAGE_NAME:latest
else
  echo "✅ No updates found. Container is up to date."
fi
