#!/bin/sh
set -x

# Use Docker buildx bake to speed up builds
export COMPOSE_BAKE=true
sudo docker compose -f /opt/stacks/dockge/compose.yml build
sudo docker compose -f /opt/stacks/dockge/compose.yml pull
sudo docker compose -f /opt/stacks/dockge/compose.yml down
sudo docker compose -f /opt/stacks/dockge/compose.yml up -d
sudo docker image prune -f
