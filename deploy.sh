#!/bin/bash

echo "Starting Deployment..."
chmod +x build.sh
./build.sh

# Docker Login
echo "s1705sha17" | docker login -u subiksha17 --password-stdin
docker tag learning_web subiksha17/myreact
docker push subiksha17/myreact

# Ensure Minikube is running before deployment
if ! minikube status | grep -q "Running"; then
    echo "Minikube is not running! Starting Minikube..."
    minikube start
fi

kubectl config use-context minikube

# Deploy to Kubernetes
kubectl create deployment myreact-app --image=subiksha17/myreact --dry-run=client -o yaml | kubectl apply -f -
kubectl scale deployment myreact-app --replicas=1
kubectl expose deployment myreact-app --type=LoadBalancer --name=myreact-service --port=8081 --target-port=80

echo "Deployment successful! Access your app via Minikube service."
