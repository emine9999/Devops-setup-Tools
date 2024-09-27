#!/bin/bash

# Exit the script on any error
set -e

# Installing Docker
echo "Installing Docker..."
sudo apt update -y
sudo apt install -y apt-transport-https curl
sudo apt install -y docker.io

sudo systemctl enable docker
sudo systemctl start docker
sudo usermod -aG docker $USER
# Remove 'newgrp docker' to avoid the script hanging
# newgrp docker

# Sleep for a few seconds to ensure the Docker installation completes
sleep 10

# Check Docker version
docker --version

#Install ansible
echo "--------------------Installing Ansible--------------------"
sudo apt update -y
sudo apt install software-properties-common -y
sudo add-apt-repository --yes --update ppa:ansible/ansible
sudo apt install ansible -y

sleep 10
ansible --version
#Add docker to sudo group
echo "--------------------Add Docker to Sudo group--------------------"
sudo groupadd docker || true  # Ignores error if the group already exists
sudo usermod -aG docker $USER
sudo chmod 777 /var/run/docker.sock


# Installing Minikube
echo "Installing Minikube..."
sudo apt update -y
sudo apt install -y curl wget apt-transport-https
curl -LO https://storage.googleapis.com/minikube/releases/latest/minikube-linux-amd64
sudo install minikube-linux-amd64 /usr/local/bin/minikube
minikube version

# Installing kubectl utility
echo "Installing kubectl..."
curl -LO "https://storage.googleapis.com/kubernetes-release/release/$(curl -s https://storage.googleapis.com/kubernetes-release/release/stable.txt)/bin/linux/amd64/kubectl"
chmod +x kubectl
sudo mv kubectl /usr/local/bin/

# Starting Minikube with Docker driver
echo "Starting Minikube..."
minikube start --driver=docker --force

# Checking Minikube status
minikube status
kubectl cluster-info

echo "Installation complete!"
