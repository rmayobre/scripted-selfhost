#!/bin/sh

# Update libraries
pkg update -y
pkg upgrade -y

# Install required software
pkg install -y openvpn

# Configure settings into jail's rc configuration file.
echo "" >> /etc/rc.conf
echo "# VPN Killswitch settings" >> /etc/rc.conf
echo "firewall_enable="YES"" >> /etc/rc.conf
echo "firewall_script="/vpn/ipfw.rules"" >> /etc/rc.conf
echo "openvpn_enable="YES"" >> /etc/rc.conf
echo "openvpn_configfile="/usr/local/etc/openvpn/openvpn.conf"" >> /etc/rc.conf
echo "openvpn_if="tun"" >> /etc/rc.conf

# Start IPFW firewall service
service ipfw start

# Start openvpn service
service openvpn start