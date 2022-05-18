# Portainer Agent behind Wireguard Connection
This stack provides a Portainer Agent connected to a Wireguard Network. This is useful if you need a secure way to connect a Portainer UI to a remote Docker instance.

Connect by using the Wireguard's Peer IP address specified within the `conf` file, using port `9001`. Example: `156.256.256.256:9001`