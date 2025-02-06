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

# Check if port 9090 is being used and remove conflicting containers
if lsof -i :9090; then
  echo "Port 9090 is in use, removing the conflicting container..."
  docker rm -f myreact_container1 || true
fi

# Run the Docker container with port 9090
docker run -d -p 9090:80 --name myreact_container1 subiksha17/myreact
