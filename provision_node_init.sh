#!/bin/bash

sudo apt install curl apt-transport-https -y

curl -fsSL  https://packages.cloud.google.com/apt/doc/apt-key.gpg|sudo gpg --dearmor -o /etc/apt/trusted.gpg.d/k8s.gpg

curl -s https://packages.cloud.google.com/apt/doc/apt-key.gpg | sudo apt-key add -

echo "deb https://apt.kubernetes.io/ kubernetes-xenial main" | sudo tee /etc/apt/sources.list.d/kubernetes.list

sudo apt update

sudo apt install wget curl vim git kubelet kubeadm kubectl -y

sudo apt-mark hold kubelet kubeadm kubectl

sudo swapoff -a

sudo modprobe overlay

sudo modprobe br_netfilter

sudo tee /etc/sysctl.d/kubernetes.conf<<EOF
net.bridge.bridge-nf-call-ip6tables = 1
net.bridge.bridge-nf-call-iptables = 1
net.ipv4.ip_forward = 1
EOF

sudo sysctl --system

sudo apt update

sudo apt install docker.io -y

sudo systemctl start docker 

sudo systemctl enable docker

sudo systemctl enable kubelet

sudo kubeadm config images pull
