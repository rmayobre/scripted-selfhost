# Portainer behind Wireguard Connection
This stack will block public access to Portainer. If you plan on connecting to the Portainer Agent in the stack, set the environment URL to `10.3.0.5:9001`.

The IP address to access your Portainer UI depends on your Wireguard configuration. Portainer uses port `9000` for its UI. Connect in a browser using the following format: `WIREGUARD_PEER_ADDRESS:9000`. 

You can also connect to the Portainer UI via `localhost:9000` if you have access to the `localhost`.