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
## PORT NO OF Prometheus :- 9090

sudo apt update -y
sudo su -
export RELEASE="2.2.1"
sudo useradd --no-create-home --shell /bin/false prometheus  
sudo useradd --no-create-home --shell /bin/false node_exporter
sudo mkdir /etc/prometheus
sudo mkdir /var/lib/prometheus
sudo chown prometheus:prometheus /etc/prometheus
sudo chown prometheus:prometheus /var/lib/prometheus
cd /opt/
wget https://github.com/prometheus/prometheus/releases/download/v2.26.0/prometheus-2.26.0.linux-amd64.tar.gz
sha256sum prometheus-2.26.0.linux-amd64.tar.gz
tar -xvf prometheus-2.26.0.linux-amd64.tar.gz
cd prometheus-2.26.0.linux-amd64
ls
sudo cp /opt/prometheus-2.26.0.linux-amd64/prometheus /usr/local/bin/
sudo cp /opt/prometheus-2.26.0.linux-amd64/promtool /usr/local/bin/
sudo chown prometheus:prometheus /usr/local/bin/prometheus
sudo chown prometheus:prometheus /usr/local/bin/promtool
sudo cp -r /opt/prometheus-2.26.0.linux-amd64/consoles /etc/prometheus
sudo cp -r /opt/prometheus-2.26.0.linux-amd64/console_libraries /etc/prometheus
sudo cp -r /opt/prometheus-2.26.0.linux-amd64/prometheus.yml /etc/prometheus
sudo chown -R prometheus:prometheus /etc/prometheus/consoles
sudo chown -R prometheus:prometheus /etc/prometheus/console_libraries
sudo chown -R prometheus:prometheus /etc/prometheus/prometheus.yml
prometheus --version
promtool --version
sudo ufw allow 9090/tcp
cd /etc/prometheus


sudo systemctl daemon-reload
sudo systemctl start prometheus
sudo systemctl enable prometheus
sudo systemctl status prometheus