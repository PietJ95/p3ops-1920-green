#!/bin/bash
#Add sudo user admin
echo "Adding sudo user, named admin.."
useradd admin -m -p "AdminGreen1"
usermod -aG wheel admin

#Changing user
echo "loggin in with admin.."
su admin
sudo su -

#Installing kvm and starting kvm
echo "Installing kvm.."
yum install qemu-kvm libvirt libvirt-python libguestfs-tools virt-install -y
echo "Starting kvm.."
service enable libvirtd
service start libvirtd

#Installing vagrant
echo "Installing and configure vagrant.."
yum -y install https://releases.hashicorp.com/vagrant/1.9.6/vagrant_1.9.6_x86_64.rpm

#Installing git
echo "Installing git on system.."
yum install git -y 

#Installing and enable ssh
yum install -y openssh-server
service sshd start

#Cloning the project repo
cd /home/admin/
git clone https://github.com/HoGentTIN/p3ops-1920-green.git

# Updating Centos machine. 
echo "Updating system.."
yum -y update

#Prompt for clearing
Read -p "Configuration has completed, type 1 to continue.." input
if $input=1
	then clear
fi

#Showing ip 
ip ad

#Prompt for reboot
Read -p "Type 1 to reboot system.." input
if $input=1
	#Rebooting systeM
	echo "Rebooting sytem.."
	reboot -f
fi

