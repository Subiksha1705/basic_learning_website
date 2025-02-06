#!/bin/bash

echo "hi123"
chmod +x build.sh
./build.sh

# Docker login securely
echo "s1705sha17" | docker login -u subiksha17 --password-stdin
docker tag learning_web subiksha17/myreact
docker push subiksha17/myreact

# Restart Minikube if necessary
minikube status | grep "Running" || minikube start
kubectl config use-context minikube

# Deploy to Kubernetes with a different port
kubectl create deployment myreact-app --image=subiksha17/myreact
kubectl scale deployment myreact-app --replicas=1
kubectl expose deployment myreact-app --type=LoadBalancer --name=myreact-service --port=8081 --target-port=80

echo "Deployment successful! Access your app via Minikube service."
