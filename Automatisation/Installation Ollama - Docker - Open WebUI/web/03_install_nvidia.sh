#!/bin/bash

echo "Configuration du repository"
curl -fsSL https://nvidia.github.io/libnvidia-container/gpgkey \
    | sudo gpg --dearmor -o /usr/share/keyrings/nvidia-container-toolkit-keyring.gpg
curl -s -L https://nvidia.github.io/libnvidia-container/stable/deb/nvidia-container-toolkit.list \
    | sed 's#deb https://#deb [signed-by=/usr/share/keyrings/nvidia-container-toolkit-keyring.gpg] https://#g' \
    | sudo tee /etc/apt/sources.list.d/nvidia-container-toolkit.list
sudo apt-get update

echo "Installation du 'NVIDIA Container Toolkit packages'"
sudo apt-get install -y nvidia-container-toolkit
sudo apt install nvidia-driver-550-server nvidia-utils-550-server -y
sudo apt install nvidia-utils-550-server  -y

sudo nvidia-ctk runtime configure --runtime=docker
sudo systemctl restart docker

