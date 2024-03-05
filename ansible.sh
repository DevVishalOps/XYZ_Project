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


#####################################################################
sudo apt update

sudo groupadd --system prometheus
sudo useradd -s /sbin/nologin --system -g prometheus prometheus

sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus

wget https://github.com/prometheus/prometheus/releases/download/v2.43.0/prometheus-2.43.0.linux-amd64.tar.gz

tar vxf prometheus*.tar.gz

cd prometheus*/

sudo mv prometheus /usr/local/bin
sudo mv promtool /usr/local/bin
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool

sudo mv consoles /etc/prometheus
sudo mv console_libraries /etc/prometheus
sudo mv prometheus.yml /etc/prometheus

sudo chown prometheus:prometheus /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /var/lib/prometheus

sudo systemctl daemon-reload

sudo systemctl enable prometheus

sudo systemctl start prometheus

sudo systemctl status prometheus

sudo ufw allow 9090/tcp