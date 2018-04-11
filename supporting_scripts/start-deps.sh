#!/usr/bin/env bash
docker-compose -f dependencies/api-gateway-postgresql.yml up -d
docker-compose -f dependencies/uaa-postgresql.yml up -d
docker-compose -f dependencies/microservice-postgresql.yml up -d


