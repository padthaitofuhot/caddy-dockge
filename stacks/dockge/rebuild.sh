#!/bin/sh
set -x

# Use Docker buildx bake to speed up builds
export COMPOSE_BAKE=true
sudo docker -f /opt/stacks/compose.yml compose build
sudo docker -f /opt/stacks/compose.yml compose pull
sudo docker -f /opt/stacks/compose.yml compose down
sudo docker -f /opt/stacks/compose.yml compose up -d
sudo docker image prune -f
