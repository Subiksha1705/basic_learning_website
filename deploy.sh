#!/bin/bash
echo "hi123"
chmod +x build.sh
./build.sh

# Ensure build.sh includes a docker build command
# For example:
# docker build -t learning_web .

docker login -u subiksha17 -p s1705sha17
docker tag learning_web subiksha17/myreact
docker push subiksha17/myreact

# Check if port 8080 is in use, and remove conflicting container or process
if lsof -i :8080; then
  echo "Port 8080 is in use, removing the conflicting container..."
  # Check if the container is already running and remove it
  docker ps -q -f name=myreact_container && docker rm -f myreact_container || true
fi

# Alternatively, try using port 9090
if lsof -i :9090; then
  echo "Port 9090 is also in use, removing the conflicting container..."
  docker ps -q -f name=myreact_container && docker rm -f myreact_container || true
fi

# Run the Docker container with port 9090 (or any other available port)
docker run -d -p 9090:80 --name myreact_container subiksha17/myreact
