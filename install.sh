#!/bin/sh
set -x

sudo cp -rv stacks /opt
sudo chown -Rc root:root "/opt/stacks"
sudo find "/opt/stacks" -type d | sudo xargs chmod -c 0750
sudo find "/opt/stacks" -type f | sudo xargs chmod -c 0640

for service in /opt/stacks/caddy /opt/stacks/dockge; do
  cd "${service}" || exit 1
  sudo docker compose up --pull --build -d
done
