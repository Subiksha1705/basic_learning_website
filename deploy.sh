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

# Check if Minikube is running, and start it if it's not
if ! minikube status | grep -q "Running"; then
  echo "Minikube is not running. Starting Minikube..."
  minikube start
else
  echo "Minikube is already running."
fi

# Set kubectl to use Minikube's context
kubectl config use-context minikube

# Check if port 8080 is in use, and remove conflicting containers
if lsof -i :8080; then
  echo "Port 8080 is in use, removing the conflicting container..."
  docker rm -f myreact_container || true
fi

# Run the Docker container or create Kubernetes resources
kubectl run myreact-app --image=subiksha17/myreact --port=80 --replicas=1

# Expose the service
kubectl expose deployment myreact-app --type=LoadBalancer --name=myreact-service --port=80 --target-port=80
