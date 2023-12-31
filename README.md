This is a Docker compose setup designed to run ROS and RVIZ. There are three containers specified in the compose.yaml file, each serving a different purpose.
The roscore container provides the core ROS server and environment, rviz supports RVIZ and visual components, whilst rosbash is for command line only.
The compose file makes the home folder available to the Docker containers, and files should be saved there. Files saved outside of the home directory may not be persistent if the Docker container is stopped and restarted.
Please repost any issues or questions to your instructor, and feel free to modify the configuration to suit your needs.

Setup procedures. Note that these steps and the Docker setup as a whole are tailored towards Ubuntu. Installation on other platforms has not been tested, and will likely require changes to this configuration.
1. Install docker https://docs.docker.com/engine/install/ubuntu/
2. Clone https://github.com/oucompsci/docker into the folder of choice.
3. Run dockerinstall.sh
4. Change directory to ~/rosdocker/compose
5. In the terminal, run "docker compose up". Note that you should not use sudo.
6. In a new terminal, in the same ~/rosdocker/compose folder, run "docker compose exec rviz bash".
7. Use ROS as normal, making sure to save files in the home directory.