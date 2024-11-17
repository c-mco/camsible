#!/bin/bash
# Update package list and install Ansible and Git
sudo apt update
sudo apt install -y ansible git

# Change to the home directory
cd ~

# Check if the camsible repository already exists
if [ -d "camsible" ]; then
  # If it exists, pull the latest changes
  echo "Camsible repository already exists. Pulling the latest changes..."
  cd camsible
  git pull
else
  # If it doesn't exist, clone the repository
  echo "Cloning the camsible repository..."
  git clone https://github.com/c-mco/camsible.git
  cd camsible
fi

# Run the camsible playbook
echo "Running the camsible playbook..."
ansible-playbook camsible.yml --ask-vault-pass 

echo "Setup complete."
