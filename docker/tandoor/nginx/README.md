## Tandoor Recipes with Traefik/Nginx Web server
This stack will configure Tandoor Recipes to use an Nginx Web server to serve media files for Tandoor Recipes. This stack is also compatible with existing Traefik Reverse Proxies.

Run the following command for the `SECRET_KEY` environment variable:
```
base64 /dev/urandom | head -c50
```

NOTE: Make sure to mount the `nginx` folder 