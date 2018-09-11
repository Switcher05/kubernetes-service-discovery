#!/bin/bash

# ============================================================
# Set version tag number
# ============================================================
TAG=$(git rev-parse --short HEAD)

# ============================================================
# Build image
# ============================================================
tar c ../target/uaa*.war Dockerfile | docker build -f Dockerfile --tag kubernetes.service.discovery/tutorial/uaa:${TAG} -

# ============================================================
# Add tags
# ============================================================
docker tag kubernetes.service.discovery/tutorial/uaa:${TAG} kubernetes.service.discovery/tutorial/uaa:local
docker tag kubernetes.service.discovery/tutorial/uaa:${TAG} kubernetes.service.discovery/tutorial/uaa:latest

docker tag kubernetes.service.discovery/tutorial/uaa:${TAG} kubernetes.service.discovery/tutorial/uaa:${TAG}
docker tag kubernetes.service.discovery/tutorial/uaa:${TAG} kubernetes.service.discovery/tutorial/uaa:local
docker tag kubernetes.service.discovery/tutorial/uaa:${TAG} kubernetes.service.discovery/tutorial/uaa:latest
