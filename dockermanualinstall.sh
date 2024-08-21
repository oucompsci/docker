#! \bin\bash

if ! grep -q "xhost +si:localuser:root" ~/.bashrc; then
  echo "xhost +si:localuser:root" >> ~/.bashrc
fi

if ! grep -q "export DOCKER_USER=$(id -u)" ~/.bashrc; then
  echo "export DOCKER_USER=$(id -u)" >> ~/.bashrc
fi
xhost +si:localuser:root
export DOCKER_USER=$(id -u)
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

currdir=$(pwd)
mkdir -p ~/rosdocker/compose
mv $currdir/compose.yaml ~/rosdocker/compose
