#!/bin/sh
set -x

sudo cp -rv stacks /opt
sudo chown -Rc root:root "/opt/stacks"
sudo find "/opt/stacks" -type d | sudo xargs chmod -c 0750
sudo find "/opt/stacks" -type f | sudo xargs chmod -c 0640

# Use Docker buildx bake to speed up builds
export COMPOSE_BAKE=true

sudo docker compose -f /opt/stacks/dockge/compose.yml up --build --pull always -d
sudo docker compose -f /opt/stacks/dockge/compose.yml logs -f
