#!/usr/bin/env bash
echo "If you are using WSL, or WSL with docker desktop please ignore docker install warnings"
sleep 10
sudo apt update
sudo apt install curl git -y

curl -fsSL https://get.docker.com | sh -- 
if ! grep -q "docker" /etc/group; then
sudo groupadd docker
fi
if ! groups | grep -q docker; then
sudo usermod -aG docker $USER
fi

cd 
git clone https://github.com/oucompsci/rosdocker.git

while true; do
    if [[ $rosdockerversion != "20.04" && $rosdockerversion != "18.06" && -z $rosdockerversion ]]; then
        clear
        echo "Choose docker version to use. If you are unsure, use 20.04."
        echo "1. 20.04"
        echo "2. 18.06"
        read -p "Enter selection: " choice
        case $choice in
            1)
            clear
            echo "export rosdockerversion='20.04'" >> ~/.bashrc
            break
            ;;
            2)
            clear
            echo "export rosdockerversion='18.06'" >> ~/.bashrc
            break
            ;;
            *)
            echo "Invalid selection."
            read -p "Press any key to continue..."
            ;;
        esac
    else
        echo "rosdockerversion is already set and invalid. Exiting."
        sleep 3
        exit 1
    fi
done

if ! grep -q "xhost +si:localuser:root" ~/.bashrc; then
  echo "xhost +si:localuser:root" >> ~/.bashrc
fi
if ! grep -q 'export UID=$(id -u)' ~/.bashrc; then
  echo 'export UID=$(id -u)' >> ~/.bashrc
fi

echo "To start run 'source ~/.bashrc'"
echo "Then run 'cd ~/rosdocker; docker compose up'"
sleep 3
