#!/usr/bin/env bash

minikube status | grep "Running" > /dev/null
if [ $? -eq 0 ]; then
  echo "Process is running. Applying no action"
else
  echo "Process is not running. Starting Minikube"
  minikube start
fi
kubectl apply -f namespace.yaml
kubectl config use-context minikube
kubectl config set-context $(kubectl config current-context) --namespace=kubernetes-service-discovery

