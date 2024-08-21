#! \bin\bash

if ! grep -q "xhost +si:localuser:root" ~/.bashrc; then
  echo "xhost +si:localuser:root" >> ~/.bashrc
fi

if ! grep -q "export DOCKER_USER=$(id -u)" ~/.bashrc; then
  echo "export DOCKER_USER=$(id -u)" >> ~/.bashrc
fi

curl -fsSL https://get.docker.com | sh -- 
if ! grep -q "docker" /etc/group; then
  sudo groupadd docker
fi
if ! groups | grep -q docker; then
  sudo usermod -aG docker $USER
fi
