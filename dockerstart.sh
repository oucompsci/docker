#! /bin/bash
xhost +si:localuser:root

mkdir -p ~/rosdocker/compose
cd ~/rosdocker/compose
git clone https://github.com/oucompsci/docker.git
sudo docker-compose up

sudo docker compose exec rosbash bash