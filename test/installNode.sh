#! /usr/bin/bash


cd /tmp

info "Downloading..."
#Downloads and installs the node exporter
wget -q https://github.com/prometheus/node_exporter/releases/download/v0.18.1/node_exporter-0.18.1.linux-amd64.tar.gz
info "Extracting..."
tar xvfz node_exporter-*.*-amd64.tar.gz
info "Copying..."
mv node_exporter-*.*-amd64/node_exporter /usr/local/bin/


#Creates System Daemon for the node exporter
info "Creating system daemon..."
touch /etc/systemd/system/nodeExporter.service
cat <<EOF > /etc/systemd/system/nodeExporter.service
[Unit]
Description=Node Exporter
After=network.target
 
[Service]
User=node_exporter
Group=node_exporter
Type=simple
ExecStart=/usr/local/bin/node_exporter
 
[Install]
WantedBy=multi-user.target
EOF

info "Creating user..."
sudo useradd -rs /bin/false node_exporter

info "Configuring daemon..."
systemctl daemon-reload
systemctl start nodeExporter.service
systemctl enable nodeExporter.service
info "Success!"