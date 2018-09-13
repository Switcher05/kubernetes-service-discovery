#!/bin/bash

set -o errexit

if [[ ! -e package.json ]]
then
  echo "This script must be run from the project root, where package.json and src/ lives."
  exit
fi

# ============================================================
# Set version tag number
# ============================================================
TAG=$(git rev-parse --short HEAD)

# ============================================================
# Build image
# ============================================================
echo docker build -f infrastructure/Dockerfile --build-arg TEAMCITY_VERSION=\"${TEAMCITY_VERSION}\" --tag kubernetes.service.discovery/tutorial/example-ui:${TAG} .
docker build -f infrastructure/Dockerfile --build-arg TEAMCITY_VERSION="${TEAMCITY_VERSION}" --tag kubernetes.service.discovery/tutorial/example-ui:${TAG} .

# ============================================================
# Add tags
# Note: $BUILD_NUMBER is a TeamCity environment variable
# ============================================================
docker tag kubernetes.service.discovery/tutorial/example-ui:${TAG} kubernetes.service.discovery/tutorial/example-ui:$(if [[ ${BUILD_NUMBER} ]]; then echo ${BUILD_NUMBER}; else echo "local"; fi)
docker tag kubernetes.service.discovery/tutorial/example-ui:${TAG} kubernetes.service.discovery/tutorial/example-ui:latest
