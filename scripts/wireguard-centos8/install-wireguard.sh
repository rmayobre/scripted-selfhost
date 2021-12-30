#!/bin/bash

# Install EPEL Release Repo
dnf install -y elrepo-release #epel-release

# Install Wireguard kernel module repo
dnf copr enable -y jdoss/wireguard

# Update your repo data
dnf update -y 

# Install the Wireguard module and tools
dnf install -y kmod-wireguard

# Activate the module
modprobe wireguard