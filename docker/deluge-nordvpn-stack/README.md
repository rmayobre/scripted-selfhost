# Summary

Docker compose stack for Deluge torrenting encrypted behind NordVPN's NordLynx. This is preconfigured to use wireguard VPN connection, however, this can be adjusted to use OpenVPN.

## Change NordVPN Credientals

### NordVPN Environment

```yaml
USER=username@email.com # change to your username
"PASS=p@ssword" # change to your password
```

## References

- [NordVPN Image GitHub](https://github.com/bubuntux/nordvpn)
- [Linuxserver Deluge Image](https://hub.docker.com/r/linuxserver/deluge)