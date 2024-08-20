#! \bin\bash

if ! grep -q "xhost +si:localuser:root" ~/.bashrc; then
  echo "xhost +si:localuser:root" >> ~/.bashrc
fi
xhost +si:localuser:root
sudo groupadd docker
sudo usermod -aG docker $USER
newgrp docker

currdir=$(pwd)
mkdir -p ~/rosdocker/compose
mv $currdir/compose.yaml ~/rosdocker/compose
