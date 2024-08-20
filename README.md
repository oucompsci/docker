This is a Docker compose setup designed to run ROS and RVIZ. There are three containers specified in the compose.yaml file, each serving a different purpose.
The roscore container provides the core ROS server and environment, rviz supports RVIZ and visual components, whilst rosbash is for command line only.
The compose file makes the home folder available to the Docker containers, and files should be saved there. Files saved outside of the home directory may not be persistent if the Docker container is stopped and restarted.
Please repost any issues or questions to your instructor, and feel free to modify the configuration to suit your needs.

Setup procedures. Note that these steps and the Docker setup as a whole are tailored towards Ubuntu. Installation on other platforms has not been tested, and will likely require changes to this configuration.

1. If you are not already using Linux, install WSL or set up a Linux VM. Apple Silicon may work using Parallels, but this has not been tested. https://learn.microsoft.com/en-us/windows/wsl/install or https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview
2. In Ubuntu, run "sudo apt update && sudo apt install curl -y"
3. Run "curl -fsSL https://raw.githubusercontent.com/oucompsci/rosdocker/main/dockerinstall.sh | bash"
4. Setup should be complete.

Manual install steps
1. If you are not already using Linux, install WSL or set up a Linux VM. Apple Silicon may work using Parallels, but this has not been tested. https://learn.microsoft.com/en-us/windows/wsl/install or https://ubuntu.com/tutorials/how-to-run-ubuntu-desktop-on-a-virtual-machine-using-virtualbox#1-overview
2. Install docker https://docs.docker.com/engine/install/ubuntu/
3. Clone https://github.com/oucompsci/docker into the folder of choice.
4. Run dockermanualinstall.sh
5. Change directory to ~/rosdocker
6. In the terminal, run "docker compose up". Note that you should not use sudo.
7. In a new terminal, in the same ~/rosdocker/compose folder, run "docker compose exec rviz bash".
8. Use ROS as normal, making sure to save files in the home directory.
