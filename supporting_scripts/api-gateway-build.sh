#!/usr/bin/env bash

# Run mvn build - prod profile used to have access to bundled UI
cd ../api-gateway
mvn clean install -DskipTests -Pprod

# Set docker env to minikube docker engine
eval $(minikube docker-env)

# Run build script
cd infrastructure
./build-api-gateway-image.sh

# Apply any existing patches to kubernetes configs
# You will need apply-all-yamls-with-patches in your path or in the correct directory for this to work.
# Use the appropriate namespace here - mine is called marketplace-dev and my patch file context is minikube
apply-all-yamls-with-patches.sh kubernetes-service-discovery minikube
