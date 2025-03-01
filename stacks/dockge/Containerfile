FROM caddy:builder AS cb
RUN caddy-builder \
    github.com/caddy-dns/cloudflare
FROM caddy:latest
COPY --from=cb /usr/bin/caddy /usr/bin/caddy
