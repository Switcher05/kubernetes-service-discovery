#!/bin/bash

# ============================================================
# Set version tag number
# ============================================================
TAG=$(git rev-parse --short HEAD)

# ============================================================
# Prerequisite TeamCity Build Step - 'tar cfz target.tgz -C target/ uaa-0.0.1-SNAPSHOT.war'
# ============================================================

# ============================================================
# Build image
# ============================================================
tar c ../target.tgz Dockerfile | docker build -f Dockerfile --tag kubernetes.service.discovery/tutorial/uaa:${TAG} -

# ============================================================
# Add tags
# ============================================================
docker tag kubernetes.service.discovery/tutorial/uaa:${TAG} kubernetes.service.discovery/tutorial/uaa:local
docker tag kubernetes.service.discovery/tutorial/uaa:${TAG} kubernetes.service.discovery/tutorial/uaa:latest

docker tag kubernetes.service.discovery/tutorial/uaa:${TAG} kubernetes.service.discovery/tutorial/uaa:${TAG}
docker tag kubernetes.service.discovery/tutorial/uaa:${TAG} kubernetes.service.discovery/tutorial/uaa:local
docker tag kubernetes.service.discovery/tutorial/uaa:${TAG} kubernetes.service.discovery/tutorial/uaa:latest
