#!/bin/bash

# Update the package list
sudo apt update

# Install software-properties-common to add the Ansible PPA
sudo apt install -y software-properties-common

# Add the Ansible PPA
sudo add-apt-repository -y ppa:ansible/ansible

# Update the package list again
sudo apt update

# Install Ansible
sudo apt install -y ansible

# Display installed versions
ansible --version
