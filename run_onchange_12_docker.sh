#!/bin/sh

# Check if Docker is installed and print version if present
if [ -x "$(command -v docker)" ]; then
    echo "Docker is already installed. Version: $(docker --version)"
else

  echo "Installing Docker"

  # Update and install required packages
  sudo apt update
  sudo apt install ca-certificates curl -y

  # Create the directory for Docker's APT key
  sudo install -m 0755 -d /etc/apt/keyrings

  # Add Docker's official GPG key
  sudo curl -fsSL https://download.docker.com/linux/ubuntu/gpg -o /etc/apt/keyrings/docker.asc
  sudo chmod a+r /etc/apt/keyrings/docker.asc

  # Add Docker's repository
  echo \
    "deb [arch=$(dpkg --print-architecture) signed-by=/etc/apt/keyrings/docker.asc] https://download.docker.com/linux/ubuntu \
    $(. /etc/os-release && echo "$VERSION_CODENAME") stable" | \
    sudo tee /etc/apt/sources.list.d/docker.list > /dev/null

  # Update apt index and install Docker
  sudo apt update
  sudo apt-get install docker-ce docker-ce-cli containerd.io docker-buildx-plugin docker-compose-plugin -y

  echo "Docker Installed Successfully"

  # Start Docker service
  sudo service docker start
fi

# Check if user is already in the Docker group
if ! groups $USER | grep -q '\bdocker\b'; then
    echo "Adding user to docker group"
    sudo groupadd docker 2>/dev/null
    sudo usermod -aG docker $USER

    # Activate the changes to groups
    newgrp docker
else
    echo "User is already in the docker group"
fi

