#!/bin/bash

minikube status | grep "Running" > /dev/null
if [ $? -eq 0 ]; then
	echo "Minikube is running. Applying no action"
else
	echo "Minikube is not running. Starting Minikube"

	# checking if platform is mac
	if [ "$(uname)" == "Darwin" ]; then
		minikube start --vm-driver hyperkit
	else
	    # checking if minikube net is active
	    # this will start minikube with kvm as the vm-driver
	    virsh net-list --inactive | grep minikube-net > /dev/null
        if [ $? -eq 0 ]; then
        echo "Starting minikube-net"
		virsh net-start minikube-net
		fi
		minikube start
	fi

	#kubectl apply -f namespace.yaml
	kubectl config set-context minikube --namespace=kubernetes-service-discovery
fi