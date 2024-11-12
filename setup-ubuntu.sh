#!/bin/bash

# Update package list and install Ansible
sudo apt update
sudo apt install -y ansible git

# Clone the camsible repository
git clone -b start-from-scratch https://github.com/c-mco/camsible.git

# Change directory to the cloned repository
cd camsible

# Run the camsible playbook
ansible-playbook camsible.yml