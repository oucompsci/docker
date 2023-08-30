#! /bin/bash
xhost +si:localuser:root
mkdir -p ~/rosdocker/compose
mkdir -p ~/rosdocker/data
cd ~/rosdocker/compose
docker-compose up