#!/bin/bash
#Installing kvm and starting kvm
echo "Installing kvm.."
yum install qemu-kvm libvirt libvirt-python libguestfs-tools virt-install -y
echo "Starting kvm.."
systemctl enable libvirtd
systemctl start libvirtd
#Installing vagrant
echo "Installing and configure vagrant.."
yum -y install https://releases.hashicorp.com/vagrant/1.9.6/vagrant_1.9.6_x86_64.rpm
#Installing git
echo "Installing git on system.."
yum install git -y 
#Installing and enable ssh
yum install -y openssh-server
systemctl sshd start
#Cloning the project repo
cd /home/admin/
git clone https://github.com/HoGentTIN/p3ops-1920-green.git
# Updating Centos machine. 
echo "Updating system.."
yum -y update
#Reboot system
echo "System will be rebooted"
sleep 10
reboot -f
