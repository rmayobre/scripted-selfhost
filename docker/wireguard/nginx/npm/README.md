# Nginx Proxy Manager behind a Wireguard connection
This stack blocks public access to an Nginx proxy via Wireguard VPN. This provides secure connections with support for SSL inside a VPN connection. This is useful for hiding services or connecting services to a remote endpoint with an encrypted connection.

## PersistentKeepalive
`PersistentKeepalive` is an option to your wireguard config file. It declares how often you will ping the Wireguard server. Because Wireguard use UDP for connection, a regular ping will keep the connection alive. This is useful if another peer connection needs to access a service behind the Nginx proxy.

For more information, Arch Linux has section in their Wireguard Wiki that covers "[Unable to establish a persistent connection behind NAT / firewall](https://wiki.archlinux.org/title/WireGuard#Unable_to_establish_a_persistent_connection_behind_NAT_/_firewall)"

### Example Peer Conf
```
[Interface]
PrivateKey = FAKE_PRIVATE_KEY17!ds283s9d@asf8*7dy83%231h$ru891r=
Address = 256.256.256.256/24
DNS = 1.1.1.1

[Peer]
PublicKey = FAKE_PUBLIC_KEY17!ds283s9d@asf8*7dy83%231h$ru891r=
AllowedIPs = 256.256.256.0/24
PersistentKeepalive = 30
Endpoint = 256.256.256.256:51820

```