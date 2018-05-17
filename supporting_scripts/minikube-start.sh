#!/bin/bash

minikube status | grep "Running" > /dev/null
if [ $? -eq 0 ]; then
	echo "Process is running. Applying no action"
else
	echo "Process is not running. Starting Minikube"

	# checking if platform is mac
	if [ "$(uname)" == "Darwin" ]; then
		minikube start --vm-driver hyperkit
	else
		minikube start
	fi

	kubectl apply -f namespace.yaml
	kubectl config set-context minikube --namespace=kubernetes-service-discovery
fi
