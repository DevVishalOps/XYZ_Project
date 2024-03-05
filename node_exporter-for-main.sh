## PORT NO OF node_exporter :- 9100
su -i
wget https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
tar xvfz node_exporter-*.*-amd64.tar.gz
mv node_exporter-*.*-amd64/node_exporter /usr/local/bin/
useradd -rs /bin/false node_exporter

## MANUALLY KARYCHE PUDCHE CONFIGURATIONS...
# sudo vim /etc/systemd/system/node_exporter.service
# [Unit]
# Description=Node Exporter
# Wants=network-online.target
# After=network-online.target

# [Service]
# User=node_exporter
# Group=node_exporter
# Type=simple
# Restart=always
# RestartSec=10s
# ExecStart=/usr/local/bin/node_exporter
#         --collector.mountstats \
#         --collector.logind \
#         --collector.processess \
#         --collector.ntp \
#         --collector.systemd \
#         --collector.tcpstat \
#         --collector.wifi \


# [Install]
# WantedBy=multi-user.target

# : wq! #to save file

# sudo systemctl daemon-reload
# sudo systemctl enable node_exporter
# sudo systemctl start node_exporter
# sudo systemctl status node_exporter

# http://<server-IP>:9100/metrics

# sudo nano /etc/prometheus/prometheus.yml

# -job_name: 'Node_Exporter'

#     scrape_interval: 5s

#     static_configs:

#       - targets: ['<Server_IP_of_Node_Exporter_Machine>:9100']

# sudo systemctl restart prometheus

# https://localhost:9100/targets
