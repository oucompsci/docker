This is a Docker compose setup designed to run ROS and RVIZ. 
The compose file makes the home folder available to the Docker containers, and files should be saved there. Files saved outside of the home directory may not be persistent if the Docker container is stopped and restarted.
Please repost any issues or questions to your instructor, and feel free to modify the configuration to suit your needs.

Setup procedures. Note that these steps and the Docker setup as a whole are tailored towards Ubuntu. Installation on other platforms has not been tested, and will likely require changes to this configuration.

1. If you are not already using Linux, install WSL or set up a Linux VM. Apple Silicon may work using Parallels, but this has not been tested. https://learn.microsoft.com/en-us/windows/wsl/install or https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview
2. Install docker https://docs.docker.com/engine/install/ubuntu/
3. Follow docker postinstall steps. https://docs.docker.com/engine/install/linux-postinstall/
4. Run the following commands:

```
sudo apt update && sudo apt upgrade -y
sudo apt install git x11-utils x11-xserver-utils x11-session-utils -y

```
5. Start here if you are on the lab machines. 
```
git clone https://github.com/oucompsci/rosdocker

#These commands should not be run again unless you intentionally remove these lines from your .bashrc file
echo "export DOCKER_UID=$(id -u)" >> ~/.bashrc
echo "xhost +si:localuser:root" >> ~/.bashrc
echo "if [[ -f /opt/ros/noetic/setup.bash ]]; then source /opt/ros/noetic/setup.bash; fi" >> ~/.bashrc

```
6. Close your terminal, and open a new one.

7. Run:
```
#If you cloned into your home folder
cd ~/rosdocker
```
This command will start the ros container. Note that THIS CONTAINER IS TEMPORARY. Files saved outside your home directory(/home/yourname) will not be saved.
Likewise, additional packages you install will not be persistent. If you'd like to keep these changes, consider committing them to the image. https://docs.docker.com/reference/cli/docker/container/commit/
This will only modify the local image, and if you delete that your changes will be lost.
```
docker compose run ros
```
8. To get a second terminal inside the container, run this command in a new terminal window, in the same folder.
```
docker compose exec -it ros /entrypoint.sh
```
9. To start roscore, run:
```
roscore
```
10. Backgroud roscore with Ctrl+z(or run roscore &), then run ```rviz```
11. Use ROS as normal, making sure to save files in the home directory inside the container.

Potentially useful info.
- If you exited the container and want to restart it, you can do so from the rosdocker folder with the ```docker compose run ros``` command.
- You can keep up to date with changes to this repo by running ```git pull``` in the rosdocker folder.
- ```docker compose ps --all``` will list all containers. You can remove ones you don't want with ```docker rm```.
