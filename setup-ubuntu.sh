#!/bin/bash
# Update package list and install Ansible and Git
sudo apt update
sudo apt install -y ansible git

# Change to the home directory
cd ~

# Check if the camsible repository already exists
if [ -d "camsible" ]; then
  # If it exists, pull the latest changes
  cd camsible
  git pull
else
  # If it doesn't exist, clone the repository
  git clone -b start-from-scratch https://github.com/c-mco/camsible.git
  cd camsible
fi

# Prompt for the Ansible Vault password
read -sp 'Enter Ansible Vault password: ' VAULT_PASS
echo

# Run the camsible playbook
ansible-playbook camsible.yml --vault-password-file <(echo "$VAULT_PASS")