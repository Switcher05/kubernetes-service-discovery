#!/bin/bash

echo "Starting cluster"
./minikube-start.sh
echo "Cluster started"

#making sure role hasn't been previously defined
kubectl delete clusterrolebindings service-reader-default &>/dev/null
kubectl delete clusterrolebindings service-reader-k8s &>/dev/null

echo "Creating cluster role"
apply-all-yamls-with-patches.sh kubernetes-service-discovery .
kubectl create clusterrolebinding service-reader-k8s \
  --clusterrole=service-reader  \
  --serviceaccount=kubernetes-service-discovery:default

kubectl create clusterrolebinding service-reader-default \
  --clusterrole=service-reader  \
  --serviceaccount=default:default
echo "Cluster role created"

echo "Starting UAA"
./uaa-build.sh
echo "UAA Started"

echo "Starting Microservice"
./microservice-build.sh
echo "Microservice Started"

echo "Starting API-Gateway"
./api-gateway-build.sh
echo "API-Gateway Started"

echo "Starting Ingress"  
cd nginx
minikube addons enable ingress
apply-all-yamls-with-patches.sh nginx-ingress nginx
echo "$(minikube ip) dev.frontend" | sudo tee -a /etc/hosts
echo "Ingress Started"  
echo "Access API-Gateway frontend at http://dev.frontend"
