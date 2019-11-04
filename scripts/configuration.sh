#!/bin/bash
#Changing user
echo "loggin in with student sudo rights  .."
sudo su -
echo "-----------------------------"
#Installing kvm and starting kvm
echo "-----------------------------"
echo "Installing and starting kvm.."
yum install qemu-kvm libvirt libvirt-python libguestfs-tools virt-install -y
service enable libvirtd
service start libvirtd
echo "-----------------------------"
#Installing vagrant
echo "Installing and configure vagrant.."
yum -y install https://releases.hashicorp.com/vagrant/1.9.6/vagrant_1.9.6_x86_64.rpm
echo "-----------------------------"
#Installing git
echo "Installing git on system.."
yum install git -y
echo "-----------------------------"
#Installing and enable ssh
yum install -y openssh-server
service sshd start
echo "-----------------------------"
#Cloning the project repo
cd /home/admin/
git clone https://github.com/HoGentTIN/p3ops-1920-green.git
echo "-----------------------------"
# Updating Centos machine.
echo "Updating system.."
yum -y update
echo "-----------------------------"
#Prompt for clearing
Read -p "Configuration has completed, type 1 to continue.." input
if $input=1
	then clear
fi

#Showing ip
echo "-----------------------------"
#$ /sbin/ifconfig eth0| grep 'inet addr:'
#$ /sbin/ifconfig eth1| grep 'inet addr:'
#$ /sbin/ifconfig lo| grep 'inet addr:'
echo "Ip wordt hier normaal getoond, nog te doen"

echo "-----------------------------"

#Prompt for reboot
Read -p "Type 1 to reboot system.." input
if $input=1
	#Rebooting systeM
	echo "Rebooting sytem.."
	reboot -f
fi
