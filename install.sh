#!/bin/sh
set -x

for dir in dockge stacks; do
  sudo cp -rv "${dir}" /opt
  sudo chown -Rc root:root "/opt/${dir}"
  sudo find "/opt/${dir}" -type d | sudo xargs chmod -c 0750
  sudo find "/opt/${dir}" -type f | sudo xargs chmod -c 0640
done

for service in /opt/dockge /opt/stacks/caddy /opt/stacks/filebrowser; do
  sudo docker compose up -f "${service}"/compose.yml -d
done
