# Summary
Docker compose file that creates an Nginx Proxy Manager stack with no access to the outside network. This useful when you need a reverse proxy behind a VPN or help proxy internal services. 

**NOTE** - because the Nginx Proxy Manager does not have its 80 and 443 ports open, a DNS challenge might be required to request SSL certs.

Once the stack as been create, add the `private-nginx-manager` container to the network that requires a reverse proxy to internal services.

## Change Database credientals
The Nginx Proxy Manager's database has default credientals in place of the `docker-compose.yml` file; **PLEASE** remember to changes before using:

### Web App
```yaml
DB_MYSQL_USER: "nginx"  # Change to match db
DB_MYSQL_PASSWORD: "CHANGE_ME" # Change to match db
DB_MYSQL_NAME: "nginx" # Change to match db
```

### Database
```yaml
MYSQL_ROOT_PASSWORD: 'CHANGE_ME' # Change to be secure
MYSQL_DATABASE: 'nginx' # Change to be secure; must match app
MYSQL_USER: 'nginx' # Change to be secure; must match app
MYSQL_PASSWORD: 'CHANGE_ME' # Change to be secure; must match app
```

## References
- [Nginx Proxy Manager GitHub](https://github.com/jc21/nginx-proxy-manager)