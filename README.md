# caddy-dockge
Adds a quick TLS front-end to [Dockge](https://github.com/louislam/dockge) using Caddy.
This is set up for using the CloudFlare DNS validation method for Let's Encrypt, but the files are easily modified for other scenarios.

# Using
1. Edit `stacks/dockge/.env`
2. Run `install.sh`
3. **IMPORTANT** login to Filebrowser https://hostname:8443 with user `admin` passwd `admin` and change the password.
4. **IMPORTANT** login to Dockge https://hostname:9443 and set the password.

# Tips
- Use Filebrowser to edit the Caddyfile to add/remove services.
- When adding another service via Dockge, and when you want to proxy it through Caddy, you'll need to specify the networks with the compose blocks below.

In the service block, add:
```yaml
    networks:
      - dockge_inside
```
In the compose root, add:
```yaml
networks:
  dockge_inside:
    external: true
```

# Upgrading
Generally you can just run `rebuild.sh`.
