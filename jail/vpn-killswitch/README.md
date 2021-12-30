# Summary
A VPN killswitch will prevent a jail from any access outside of its local network or OpenVPN connection. If the OpenVPN connection is lost at any point, the firewall rules will block all networking (except the local network). This is particularly useful if you want your jail to download data only through it's VPN connection.

# How To Use

## Copy Scripts into Jail
Make sure you copy both `ipfw.rules` and `killswitch-engage.sh` into the `/vpn/` directory of your jail (create the `vpn` directory). 
    
_Optionally_ you can do this using the jail's mountpoints (just point these files to the `/vpn/` directory of your jail).

## Prepare OpenVPN Config File
Get the `openvpn.conf` file from your VPN provider. This file is required to tell OpenVPN how to connect to your VPN provider. Some providers will give you `.opvn` file; rename the extension to `.conf` for OpenVPN to work.

Place this file in the `/usr/local/etc/openvpn/` directory of your jail.

_Optionally_ you can do this using the jail's mountpoints, as well.

## Run killswitch-engage Script
Before you run the `killswitch.engage.sh` script, confirm the `user` and `iprange` (IP Address range) values in the `ipfw.rules` file. 

`user` needs to be the same user that runs the application inside your jail. 

`iprange` should be the IP address range of your home network (most are 192.168.0.0/24 or 192.168.1.0/24).

```sh
# Inside ipfw.rules

...

set cmd="ipfw -q add"
set vpn="tun0"
set user="user" # Change this to the correct user
set iprange="192.168.0.0/24" # Change this to the appropriate range.

...

```

Now run `killswitch-engage.sh` to start `openvpn` and `ipfw` services.

```sh
chmod +x /vpn/killswitch-engage.sh
/vpn/killswitch-engage.sh
```

## Test Connection
Run this command to check if your jail's public IP address changed:
```sh
curl ifconfig.me
```