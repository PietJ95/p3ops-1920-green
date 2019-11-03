# CentOS kickstart file

## 1. Genereer voorbeeld ks file adhv ubuntu

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

## 2. Installeer centos op een vm en neem de anaconda-ks.cfg

First, we’ll have to change the installation media from “cdrom” to “url”. I’m using one of the [mirrors](https://www.centos.org/download/mirrors/) available:

```
# Use CDROM installation media
#cdrom

# Use network installation
url --url="http://mirror.zetup.net/CentOS/7/os/x86_64/"
```



We’ll also have to tell the installation to clear out any previous partitions on “sda” (the primary disk):

```
# Partition clearing information
#clearpart --none --initlabel
clearpart --all --drives=sda
```

Since we want the machine to automatically reboot after completed installation, we’ll have to tell it to do that:

```
# Reboot after installation
reboot
```



- [Kickstart options](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-kickstart-syntax.html#sect-kickstart-commands) - A list of all commands and options
- [%pre](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-kickstart-syntax.html#sect-kickstart-preinstall) - Pre-installation scripts
- [%post](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-kickstart-syntax.html#sect-kickstart-postinstall) - Post-installation scripts
- [%addon](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-kickstart-syntax.html#sect-kickstart-addon) - Add-ons for Anaconda which expand the functionality of the installer
- [%packages](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-kickstart-syntax.html#sect-kickstart-packages) - Software packages to install

I recommend taking a minute or two to read through the [Kickstart How-To](https://access.redhat.com/documentation/en-US/Red_Hat_Enterprise_Linux/7/html/Installation_Guide/sect-kickstart-howto.html).

## Verify the Kickstart file

You can make sure your Kickstart file is valid by using “ksvalidator”:

Install ksvalidator:

```
yum install pykickstart
```

Run ksvalidator on your Kickstart file:

```
ksvalidator /path/to/anaconda-ks.cfg
```







sources:

* https://access.redhat.com/documentation/en-us/red_hat_enterprise_linux/7/html/installation_guide/sect-kickstart-syntax#sect-kickstart-packages