#!/bin/bash

echo "192.168.56.5 worker" | sudo tee -a /etc/hosts

JOIN_COMMAND=$(cat /vagrant/k8s_join_command.txt)

$JOIN_COMMAND