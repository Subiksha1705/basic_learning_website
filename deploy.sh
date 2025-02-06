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

# Run the Docker container
docker run -d -p 8080:80 --name myreact_container subiksha17/myreact
