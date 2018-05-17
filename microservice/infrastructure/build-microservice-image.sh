#!/bin/bash

# ============================================================
# Set version tag number
# ============================================================
TAG=$(git rev-parse --short HEAD)

# ============================================================
# Prerequisite TeamCity Build Step - 'tar cfz target.tgz -C target/ microservice-0.0.1-SNAPSHOT.war'
# ============================================================

# ============================================================
# Build image
# ============================================================
tar c ../target/microservice*.war Dockerfile | docker build -f Dockerfile --tag kubernetes.service.discovery/tutorial/microservice:${TAG} -

# ============================================================
# Add tags
# ============================================================
docker tag kubernetes.service.discovery/tutorial/microservice:${TAG} kubernetes.service.discovery/tutorial/microservice:local
docker tag kubernetes.service.discovery/tutorial/microservice:${TAG} kubernetes.service.discovery/tutorial/microservice:latest

docker tag kubernetes.service.discovery/tutorial/microservice:${TAG} kubernetes.service.discovery/tutorial/microservice:${TAG}
docker tag kubernetes.service.discovery/tutorial/microservice:${TAG} kubernetes.service.discovery/tutorial/microservice:local
docker tag kubernetes.service.discovery/tutorial/microservice:${TAG} kubernetes.service.discovery/tutorial/microservice:latest
