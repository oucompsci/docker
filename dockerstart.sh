#! /bin/bash
xhost +si:localuser:root
mkdir -p ~/rosdocker/compose
cd ~/rosdocker/compose
docker compose up