#!/bin/bash

echo "hi123"
chmod +x build.sh
./build.sh

# Ensure build.sh includes a docker build command
# For example:
# docker build -t learning_web .

# Docker login
docker login -u subiksha17 -p s1705sha17
docker tag learning_web subiksha17/myreact
docker push subiksha17/myreact

# Set kubectl to use Minikube's context
kubectl config use-context minikube

# Check if port 8080 or 9090 is in use, and remove conflicting containers
if lsof -i :8080; then
  echo "Port 8080 is in use, removing the conflicting container..."
  # Check if the container is already running and remove it
  docker ps -q -f name=myreact_container && docker rm -f myreact_container || true
fi

# Alternatively, try using port 9090
if lsof -i :9090; then
  echo "Port 9090 is in use, removing the conflicting container..."
  docker ps -q -f name=myreact_container && docker rm -f myreact_container || true
fi

# Create a Kubernetes Deployment using kubectl
kubectl run myreact-app --image=subiksha17/myreact --port=80 --replicas=1

# Expose the Kubernetes Deployment on port 9090
kubectl expose deployment myreact-app --type=LoadBalancer --name=myreact-service --port=80 --target-port=80 --name=myreact-service

# Optionally, you can access the Minikube service:
minikube service myreact-service --url
