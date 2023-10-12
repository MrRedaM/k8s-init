#!/bin/bash

echo "192.168.56.5 worker" | sudo tee -a /etc/hosts

JOIN_COMMAND=$(cat /vagrant/k8s_join_command.txt)

$JOIN_COMMAND

# Install NFS server
sudo apt-get update
sudo apt-get install -y nfs-kernel-server

# Enable NFS server on system startup
sudo systemctl enable nfs-kernel-server

# Create the NFS directory
sudo mkdir /nfs
sudo mkdir /nfs/pcap
sudo mkdir /nfs/csv
sudo mkdir /nfs/classification

# Set ownership and permissions on the NFS directory
sudo chown nobody:nogroup /nfs
sudo chmod 777 /nfs

# Add the NFS export configuration to /etc/exports
echo "/nfs *(rw,async,no_subtree_check,no_root_squash)" | sudo tee -a /etc/exports

# Refresh NFS exports
sudo exportfs -a