#!/bin/sh
set -x

# Use Docker buildx bake to speed up builds
export COMPOSE_BAKE=true

sudo docker compose -f /opt/stacks/dockge/compose.yml pull --include-deps
sudo docker compose -f /opt/stacks/dockge/compose.yml build --pull
sudo docker compose -f /opt/stacks/dockge/compose.yml down
sudo docker compose -f /opt/stacks/dockge/compose.yml up -d
sudo docker image prune -f
sudo docker compose -f /opt/stacks/dockge/compose.yml logs -f
