#!/usr/bin/env bash

#Run mvn build
cd ..
cd uaa
mvn clean install -DskipTests -Pprod

# tar build artifact for docker build
tar cfz target.tgz -C target/ uaa-0.0.1-SNAPSHOT.war

#Small period of time to make sure tar is completed
sleep 3

# Set docker env to minikube docker engine
eval $(minikube docker-env)

# cd to infrastructure working directory
cd infrastructure

# run build script
./build-uaa-image.sh

# clean up
cd ..
rm -f target.tgz
cd infrastructure

# apply any existing patches to kubernetes configs
# You will need apply-all-yamls-with-patches in your path or in the correct directory for this to work.
# Use the appropriate namespace here - mine is called marketplace-dev and my patch file context is minikube
apply-all-yamls-with-patches.sh kubernetes-service-discovery minikube