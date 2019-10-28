# CentOS kickstart file

## 1. kickstart configurator (gui) 

	sudo apt-get install system-config-kickstart
	system-config-kickstart
### Basic configuration

Default Language: English(UK)
keyboard: Belgian
Mouse: auto
Time Zone: Europe/Brussels
Language Support: Dutch (Belgium)
Target Architecture: x86
v Reboot system after installation
v Perform installation in text mode

### Installation Method
Ik stel het IP adres van onze PXE-server in voor de optie FTP Server hier.

o Perform new installation
o FTP
FTP Server:	172.16.1.6
FTP Directory: /srv/tftp

### Boot Loader Options

o Clear Master Boot Record
o Remove all existing partitions
o Initialize the disk label

### Network configuration

Add Network Device : eth0 : DHCP

### Authentication

/

### User configuration

Full Name: Robin Boone
Username: admin
Password: GPass123

### Firewall configuration

Trusted devices: v eth1
							v eth0

Trusted services: v www (http)
							v FTP
							v ssh
							v Mail (SMTP)

### Display configuration

/

### Package Selection

v Ubuntu Desktop

### Pre-Installation Script

### Post-Installation Script

sudo yum update









sudo yum upgrade

installeer cms saltstack

installeer monitoring => contacteer monitoring

