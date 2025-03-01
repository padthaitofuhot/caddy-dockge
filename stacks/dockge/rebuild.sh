#!/bin/sh
set -x

# Use Docker buildx bake to speed up builds
export COMPOSE_BAKE=true
sudo docker compose -f /opt/stacks/compose.yml build
sudo docker compose -f /opt/stacks/compose.yml pull
sudo docker compose -f /opt/stacks/compose.yml down
sudo docker compose -f /opt/stacks/compose.yml up -d
sudo docker image prune -f
