#!/bin/bash

# ============================================================
# Set version tag number
# ============================================================
TAG=$(git rev-parse --short HEAD)

# ============================================================
# Prerequisite Build Step - 'tar cfz target.tgz -C target/ api-gateway-0.0.1-SNAPSHOT.war'
# ============================================================

# ============================================================
# Build image
# ============================================================
tar c ../target.tgz Dockerfile | docker build -f Dockerfile --tag kubernetes.service.discovery/tutorial/api-gateway:${TAG} -

# ============================================================
# Add tags
# ============================================================
docker tag kubernetes.service.discovery/tutorial/api-gateway:${TAG} kubernetes.service.discovery/tutorial/api-gateway:local
docker tag kubernetes.service.discovery/tutorial/api-gateway:${TAG} kubernetes.service.discovery/tutorial/api-gateway:latest

docker tag kubernetes.service.discovery/tutorial/api-gateway:${TAG} kubernetes.service.discovery/tutorial/api-gateway:${TAG}
docker tag kubernetes.service.discovery/tutorial/api-gateway:${TAG} kubernetes.service.discovery/tutorial/api-gateway:local
docker tag kubernetes.service.discovery/tutorial/api-gateway:${TAG} kubernetes.service.discovery/tutorial/api-gateway:latest
