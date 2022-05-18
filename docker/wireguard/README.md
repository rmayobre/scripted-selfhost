# Wireguard for Docker Compose
This is a collection of different Docker Stacks that can be built using `docker-compose`.

 - `npm` - a stack to place an Nginx Proxy Manager contain behind a Wireguard connection. The result is a reverse proxy that can only be accessed from local host and another Wireguard peer connection.
 - `portainer` - docker compose stacks that cover different uses for portainer and portainer agent behind a Wireguard connection.

 ## Wireguard on CentOS 8 Distros
 CentOS 8 and CentOS 8 based distros do not come with the Wireguard dependencies installed. Run the provided script in this directory to install the Wireguard modules. NOTE: this does not come with Wireguard Tools. This is specifically to get Wireguard installed for docker containers that will make use of the host's kernel.

 ```bash
chmod +x ./install-wireguard-centos.sh
./install-wireguard-centos.sh
```

## Compatibility
- Has been tested on Rocky Linux.
- May not be required for Fedora or Fedora based distros.