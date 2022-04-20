# Authelia with Traefik Proxy
Configure Authelia to work with Traefik as the Reverse Proxy.

## Configure Authenticated Services

```yaml
  my-service: # Rename to your service
    image: my-image # Apply your docker image.
    networks:
      - traefik-network # make sure its on the same network as Traefik
    labels:
      - 'traefik.enable=true'
      # Update to your domain and subdomain for this service.
      - 'traefik.http.routers.nextcloud.rule=Host(`subdomain.example.com`)'
      - 'traefik.http.routers.nextcloud.entrypoints=https'
      - 'traefik.http.routers.nextcloud.tls=true'
      - 'traefik.http.routers.nextcloud.middlewares=authelia@docker'
    expose: # Expose any required ports for this service.
      - 443
    restart: unless-stopped

```