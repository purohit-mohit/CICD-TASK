#!/bin/bash

CONTAINER_NAME=node-app-auto
IMAGE_NAME=mohit682/node-app:latest

echo "🔁 Pulling latest image from Docker Hub..."
docker pull $IMAGE_NAME

echo "🧹 Stopping and removing old container if it exists..."
docker stop $CONTAINER_NAME
docker rm $CONTAINER_NAME

echo "🚀 Starting new container..."
docker run -d -p 3000:3000 --name $CONTAINER_NAME $IMAGE_NAME
