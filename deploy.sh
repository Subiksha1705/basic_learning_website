#!/bin/bash
echo "hi123"
sh 'chmod +x build.sh'
sh './build.sh'
docker login -u subiksha17 -p s1705sha17
docker tag learning_web subiksha17/myreact
docker push subiksha17/myreact

# Run the Docker container
docker run -d -p 80:80 --name myreact_container subiksha17/myreact
